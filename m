Return-Path: <SRS0=KKmW=IE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:33180 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750825AbeEQEVT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 17 May 2018 00:21:19 -0400
Received: by mail-pl0-f65.google.com with SMTP id n10-v6so1707315plp.0
        for <devicetree@vger.kernel.org>; Wed, 16 May 2018 21:21:19 -0700 (PDT)
Subject: Re: [bug report] of: Introduce Device Tree resolve support.
References: <20180516141119.GA27580@mwanda>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <f0474f9e-c450-2f9d-d851-fb7a98f2b7f5@gmail.com>
Date: Wed, 16 May 2018 21:21:17 -0700
MIME-Version: 1.0
In-Reply-To: <20180516141119.GA27580@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, pantelis.antoniou@konsulko.com
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Dan,

On 05/16/18 07:11, Dan Carpenter wrote:
> Hello Pantelis Antoniou,
> 
> The patch 7941b27b16e3: "of: Introduce Device Tree resolve support."
> from Jul 4, 2014, leads to the following static checker warning:
> 
> 	drivers/of/resolver.c:125 update_usages_of_a_phandle_reference()
> 	error: buffer underflow 'prop->value' 's32min-s32max'
> 
> drivers/of/resolver.c
>     72  static int update_usages_of_a_phandle_reference(struct device_node *overlay,
>     73                  struct property *prop_fixup, phandle phandle)
>     74  {
>     75          struct device_node *refnode;
>     76          struct property *prop;
>     77          char *value, *cur, *end, *node_path, *prop_name, *s;
>     78          int offset, len;
>                     ^^^^^^
>     79          int err = 0;
>     80  
>     81          value = kmemdup(prop_fixup->value, prop_fixup->length, GFP_KERNEL);
>     82          if (!value)
>     83                  return -ENOMEM;
>     84  
>     85          /* prop_fixup contains a list of tuples of path:property_name:offset */
>     86          end = value + prop_fixup->length;
>     87          for (cur = value; cur < end; cur += len + 1) {
>     88                  len = strlen(cur);
>     89  
>     90                  node_path = cur;
>     91                  s = strchr(cur, ':');
>     92                  if (!s) {
>     93                          err = -EINVAL;
>     94                          goto err_fail;
>     95                  }
>     96                  *s++ = '\0';
>     97  
>     98                  prop_name = s;
>     99                  s = strchr(s, ':');
>    100                  if (!s) {
>    101                          err = -EINVAL;
>    102                          goto err_fail;
>    103                  }
>    104                  *s++ = '\0';
>    105  
>    106                  err = kstrtoint(s, 10, &offset);
>                                                ^^^^^^^
> Smatch marks data that we get from the kstrtoint() as untrusted.
> 
>    107                  if (err)
>    108                          goto err_fail;
>    109  
>    110                  refnode = __of_find_node_by_full_path(of_node_get(overlay), node_path);
>    111                  if (!refnode)
>    112                          continue;
>    113  
>    114                  for_each_property_of_node(refnode, prop) {
>    115                          if (!of_prop_cmp(prop->name, prop_name))
>    116                                  break;
>    117                  }
>    118                  of_node_put(refnode);
>    119  
>    120                  if (!prop) {
>    121                          err = -ENOENT;
>    122                          goto err_fail;
>    123                  }
>    124  
>    125                  *(__be32 *)(prop->value + offset) = cpu_to_be32(phandle);
>                                     ^^^^^^^^^^^^^^^^^^^^
> So then it complains about this...
> 
> We probably trust this data and are fine with it writing to where ever

Thanks for reporting this.

No, we should not trust this data.

Patch sent to validate the value of offset.

-Frank

> but it would be nice for reviewers to prevent the array
> underflow/overflow warning.  I'm not even sure how big prop->value is
> though so I don't know what the bounds check should be.
> 
>    126          }
>    127  
>    128  err_fail:
>    129          kfree(value);
>    130          return err;
> 
> regards,
> dan carpenter
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

