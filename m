Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFED9C433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 15:44:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C6B520872
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 15:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598629480;
	bh=88kJ/G7CWpX+LGOzEx33CLHVpu7kYOqIcbs+2c87R24=;
	h=Date:From:To:Subject:References:In-Reply-To:List-ID:From;
	b=Gbk3bEAtnoJIWukhT+zLe3k8lXIR0zW5pUyrnW9UfcbpB/T236cO56oj8qtFbFlBf
	 S8PRr70RY+TlV1+lcA/X1LsVruFiOKLWjEFgKYYdmc+HKTBPsgHoMtuS8EtmlZPNXi
	 SHmw/uOi7xK3j6MqtIm6MhInmgPKmmVbAsGFRE3M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgH1Poj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 11:44:39 -0400
Received: from mail-ej1-f48.google.com ([209.85.218.48]:36584 "EHLO
        mail-ej1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgH1Poh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 11:44:37 -0400
Received: by mail-ej1-f48.google.com with SMTP id l2so2122873eji.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 08:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kPFFssSK0FB0b8xHaLwh78SxNX/7VnzwnzslGetfO38=;
        b=DgQDaiow04QnGJVmNu212fh1JwZLjCCqOg0iFdeMLJeG7RbkClHi11lhJ9+7bexwkp
         a03DD7reSLGpmeJt5DBRSDAMRKcwZsRo/6zIKUjqmVlhaDjpcVqNrs1hEdvYwkO7+vPB
         CJBmvRpHCB2grPBstbwIsS1gncHBVYJP55gcHvkpCd7w+9NjwtlI8EPYx0MwErtPAcbt
         abkzsWCutgu3jWP1vZx8BjOngg8pMYVxI6aOOll6Gnyhs8ggtlUWBJFh9rh/qZUfRBJU
         E2/3gDjWsHFmrxit2FRlw6iw01JF8G8zmBJ3R/G0zB79qvFVFNkBejSc/VxFRO9VYV/z
         h99w==
X-Gm-Message-State: AOAM532WbNQ2/A7HLuAy4H3brr3klZsXGXnFUZT7Y2iH4B6NAbyZMcGI
        +57Nff4V1uaOtFTKdz21x9UPDmdl/wJ3aw==
X-Google-Smtp-Source: ABdhPJwlBIgg7Pcv1a48QyOYOjGuraP+JXawT7+eQ2ioaYlgUu5/bLt3ZRFjGTjWrOfOjd2heWB9AQ==
X-Received: by 2002:a17:906:5796:: with SMTP id k22mr2594760ejq.77.1598629474886;
        Fri, 28 Aug 2020 08:44:34 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id fx15sm1265236ejb.1.2020.08.28.08.44.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 08:44:34 -0700 (PDT)
Date:   Fri, 28 Aug 2020 17:44:32 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: dtschema v2020.08.1 json.decoder.JSONDecodeError error
Message-ID: <20200828154432.GA24473@kozik-lap>
References: <20200828095115.GA18030@pi3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200828095115.GA18030@pi3>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Aug 28, 2020 at 11:51:15AM +0200, Krzysztof Kozlowski wrote:
> Hi Rob,
> 
> I am trying dt_bindings_check with on top of next-20200826 with dtschema
> v2020.08.01 and got errors on all schemas:
> 
> =======
> Traceback (most recent call last):
>   File "/home/krzk/.local/lib/python3.5/site-packages/jsonschema/validators.py", line 777, in resolve_from_url
>     document = self.resolve_remote(url)
>   File "/home/krzk/.local/lib/python3.5/site-packages/jsonschema/validators.py", line 860, in resolve_remote
>     result = requests.get(uri).json()
>   File "/home/krzk/.local/lib/python3.5/site-packages/requests/models.py", line 897, in json
>     return complexjson.loads(self.text, **kwargs)
>   File "/usr/lib/python3.5/json/__init__.py", line 319, in loads
>     return _default_decoder.decode(s)
>   File "/usr/lib/python3.5/json/decoder.py", line 339, in decode
>   DTEX    Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.example.dts
>     obj, end = self.raw_decode(s, idx=_w(s, 0).end())
>   File "/usr/lib/python3.5/json/decoder.py", line 357, in raw_decode
>     raise JSONDecodeError("Expecting value", s, err.value) from None
> json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)
> 
> During handling of the above exception, another exception occurred:
> 
> Traceback (most recent call last):
>   File "/home/krzk/.local/bin/dt-doc-validate", line 67, in <module>
>     ret = check_doc(f)
>   File "/home/krzk/.local/bin/dt-doc-validate", line 33, in check_doc
>     for error in sorted(dtschema.DTValidator.iter_schema_errors(testtree), key=lambda e: e.linecol):
>   File "/home/krzk/.local/lib/python3.5/site-packages/dtschema/lib.py", line 663, in iter_schema_errors
>     meta_schema = cls.resolver.resolve_from_url(schema['$schema'])
>   File "/home/krzk/.local/lib/python3.5/site-packages/jsonschema/validators.py", line 779, in resolve_from_url
>     raise exceptions.RefResolutionError(exc)
> jsonschema.exceptions.RefResolutionError: Expecting value: line 1 column 1 (char 0)
> =======
> 
> 
> Python v3.5.2
> Ubuntu 16.04

I tried also on newer machine (Ubuntu 18.04, Python 3.6.9) - the same.

Best regards,
Krzysztof

