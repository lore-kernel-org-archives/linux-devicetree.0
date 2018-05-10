Return-Path: <SRS0=9rWN=H5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:20480 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S935285AbeEJNut (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 10 May 2018 09:50:49 -0400
Date: Thu, 10 May 2018 15:50:48 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: When does of_match_device() return NULL ?
In-Reply-To: <CAL_JsqJ=CZOgJi048rbeJagynGpd=eM+Yu8-ntyihrYwTWEX0Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1805101550240.2589@hadrien>
References: <20180509144119.GA6358@himanshu-Vostro-3559> <CAL_JsqJPXyq59oK+n+w7wX=4ua3Qe9oSiAV99ADB0f-5-a0VLg@mail.gmail.com> <alpine.DEB.2.20.1805100728350.2589@hadrien> <CAL_JsqJ=CZOgJi048rbeJagynGpd=eM+Yu8-ntyihrYwTWEX0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Himanshu Jha <himanshujha199640@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

> > Is there any way that one can
> > infer from the presence or absence of either kind of declaration that
> > there is only one way to cause the probe function to be invoked?
>
> I think the short answer is no.
>
> DT requires an of_match_table. ACPI requires an acpi_match_table
> (IIRC). PCI/USB use VID/PID. Then you have old style platform device
> and driver .name matching. And then there's manually binding.

Thanks for all of the clarifications!

julia
