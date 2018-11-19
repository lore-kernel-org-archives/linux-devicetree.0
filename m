Return-Path: <SRS0=byPw=N6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f179.google.com ([209.85.215.179]:46173 "EHLO
        mail-pg1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731313AbeKTIjO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 20 Nov 2018 03:39:14 -0500
Received: by mail-pg1-f179.google.com with SMTP id w7so14419918pgp.13
        for <devicetree@vger.kernel.org>; Mon, 19 Nov 2018 14:13:30 -0800 (PST)
Subject: Re: should i be able to "dtx_diff" compare .dts files outside of
 kernel tree?
References: <alpine.LFD.2.21.1811171602340.4420@localhost.localdomain>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <345591be-7bf2-91e0-b85c-6894f6e2c059@gmail.com>
Date: Mon, 19 Nov 2018 14:13:27 -0800
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.1811171602340.4420@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Robert,

On 11/17/18 1:04 PM, Robert P. J. Day wrote:
> 
>   once upon a time, i asked:
> 

I'll reply to the year old email, because it includes some more
context.

> https://www.spinics.net/lists/devicetree/msg200409.html

-Frank

> 
> a quick perusal of the dtx_diff script in the current kernel source
> tree suggests i should be able to compare two .dts files as long as i
> specify a source tree with "-s", but as i pointed out in that post,
> that doesn't work.
> 
>   should it? the comments in the script seem to *imply* that that
> should work. thoughts?
> 
> rday
>
