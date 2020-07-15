Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044F9C433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 16:39:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1614206D5
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 16:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTv1SNma"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725831AbgGOQjb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 12:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgGOQja (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 12:39:30 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB83C061755;
        Wed, 15 Jul 2020 09:39:30 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 1so2322667pfn.9;
        Wed, 15 Jul 2020 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tih56cWIuhah+NxYjyGY7nozc2ke3B+ic/cpjo/VAs4=;
        b=aTv1SNma4AeJkAn3An13OGAw51wR7sSn4ngpjS1KFXcunS5sSgFvqql4eGbNDXgBit
         Ax4WruimzxUGWzlq7UuVnNdaKr9cG63zqL/Ul3ohgM3FQ+2h1KLBGY4u013nqkggr0gH
         0QcoWIdjqhRBQ14MXirWgmeqUK4libtYWTF4j58JNEhUeyCBHQ8qrSIaeN/Jqt4Ji4iS
         h1twCjlO9Xo/0RS3ZoV+NLei2OpXOftrggtt0rXX74rmbTWOwrmPhDJVXDRSHCW3qsi3
         DkBVT01+/EQJwYIZx5Q1AanMP0quoqmsUrfO8eLeiYH1Qy9eS+EuYsEjptnxxXN/NqLd
         896g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tih56cWIuhah+NxYjyGY7nozc2ke3B+ic/cpjo/VAs4=;
        b=BohNbmt7uBFgop0HWhaCyAsVQnygoVwbH3BDgQ5Lynb+s8YOb50EvIEA3t4W2a0xZW
         AYW2HySyp3gaIWhwyZNxoS/GLW449hZwYp4c7TYjrCwv6HlhhoZ6FP62XJWA4OpQl5/p
         CgHr6L2+k7yuTTV2zxqTfQSVzSVlx3d5oHXLoqAgGCTudjICGktvJd61VePSFN6pgrYk
         93Zy3I+2DpheyQpsZaZeN6kJTGX3WW7xNWsgHXoo7hFsSH8eePMb+/JH7y8pEjb27Drl
         naj2ajsgfZWzx0uwfpUtjT6n4Ss1tIohWFqSn+0l1tkJiQig1dVrSoQ7hzo8tyx44KZQ
         tt4Q==
X-Gm-Message-State: AOAM530btYqHxTlcv01JIGxaEwZ2kZ/bEr1ewOBY812Q0byLYEiQ9DHe
        PhhOeqrg5vYOZ6wZVTdabqz0HK29
X-Google-Smtp-Source: ABdhPJwGZTlNf3LlWQjyga5juGBAPkBlGX7f99NdT/kIAngA7YMaZpNFWW+Dw5t5Ky+yT41hORN5+A==
X-Received: by 2002:a63:4f1f:: with SMTP id d31mr472080pgb.241.1594831169714;
        Wed, 15 Jul 2020 09:39:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o12sm2742308pfu.188.2020.07.15.09.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 09:39:29 -0700 (PDT)
Subject: Re: [PATCH 2/4] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Tobias Schramm <t.schramm@manjaro.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-3-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <38a0c13d-fd78-9e67-91c8-4b86c437593e@roeck-us.net>
Date:   Wed, 15 Jul 2020 09:39:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714113617.10470-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 7/14/20 4:36 AM, Hans de Goede wrote:
> This can be used by Type-C controller drivers which use a standard
> usb-connector fwnode, with altmodes sub-node, to describe the available
> altmodes.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/usb/typec/class.c | 56 +++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h |  7 +++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index c9234748537a..47de2b2e3d54 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1607,6 +1607,62 @@ typec_port_register_altmode(struct typec_port *port,
>  }
>  EXPORT_SYMBOL_GPL(typec_port_register_altmode);
>  
> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
> +	const struct typec_altmode_ops *ops, void *drvdata,
> +	struct typec_altmode **altmodes, size_t n,
> +	struct fwnode_handle *fwnode)
> +{
> +	struct fwnode_handle *altmodes_node, *child;
> +	struct typec_altmode_desc desc;
> +	struct typec_altmode *alt;
> +	size_t index = 0;
> +	u32 svid, vdo;
> +	int ret;
> +
> +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
> +	if (!altmodes_node)
> +		return;
> +
> +	child = NULL;
> +	while ((child = fwnode_get_next_child_node(altmodes_node, child))) {
> +		ret = fwnode_property_read_u32(child, "svid", &svid);
> +		if (ret) {
> +			dev_err(&port->dev, "Error reading svid for altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;

The properties are mandatory. I think the errors should not be ignored.

> +		}
> +
> +		ret = fwnode_property_read_u32(child, "vdo", &vdo);
> +		if (ret) {
> +			dev_err(&port->dev, "Error reading vdo for altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;
> +		}
> +
> +		if (index >= n) {
> +			dev_err(&port->dev, "Error not enough space for altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;

Seems to be pointless to continue here.

> +		}
> +
> +		desc.svid = svid;
> +		desc.vdo = vdo;
> +		desc.mode = index + 1;
> +		alt = typec_port_register_altmode(port, &desc);
> +		if (IS_ERR(alt)) {
> +			dev_err(&port->dev, "Error registering altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;

Maybe there is a reason to ignore all those errors. If so,
that should be explained.

> +		}
> +
> +		alt->ops = ops;
> +		typec_altmode_set_drvdata(alt, drvdata);
> +		altmodes[index] = alt;
> +		index++;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(typec_port_register_altmodes_from_fwnode);
> +
>  /**
>   * typec_register_port - Register a USB Type-C Port
>   * @parent: Parent device
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 5daa1c49761c..fbe4bccb3a98 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -17,6 +17,7 @@ struct typec_partner;
>  struct typec_cable;
>  struct typec_plug;
>  struct typec_port;
> +struct typec_altmode_ops;
>  
>  struct fwnode_handle;
>  struct device;
> @@ -121,6 +122,12 @@ struct typec_altmode
>  struct typec_altmode
>  *typec_port_register_altmode(struct typec_port *port,
>  			     const struct typec_altmode_desc *desc);
> +
> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
> +	const struct typec_altmode_ops *ops, void *drvdata,
> +	struct typec_altmode **altmodes, size_t n,
> +	struct fwnode_handle *fwnode);
> +
>  void typec_unregister_altmode(struct typec_altmode *altmode);
>  
>  struct typec_port *typec_altmode2port(struct typec_altmode *alt);
> 

