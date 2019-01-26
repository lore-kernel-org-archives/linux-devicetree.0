Return-Path: <SRS0=+7pD=QC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726070AbfAZRep (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 26 Jan 2019 12:34:45 -0500
Date: Sat, 26 Jan 2019 17:34:38 +0000
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: pressure: add LPS22HH bindings
Message-ID: <20190126173438.5433d03f@archlinux>
In-Reply-To: <75c2b56fcacf732d87cdfc11f947a1a275b95c6b.1547930719.git.lorenzo.bianconi@redhat.com>
References: <cover.1547930719.git.lorenzo.bianconi@redhat.com>
        <75c2b56fcacf732d87cdfc11f947a1a275b95c6b.1547930719.git.lorenzo.bianconi@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, mario.tesi@st.com
List-ID: <devicetree@vger.kernel.org>

On Sat, 19 Jan 2019 21:47:53 +0100
Lorenzo Bianconi <lorenzo.bianconi@redhat.com> wrote:

> Fix following checkpatch warnings:
> WARNING: DT compatible string "st,lps22hh" appears un-documented -- check ./Documentation/devicetree/bindings/
> 		.compatible = "st,lps22hh",
> 
> WARNING: DT compatible string "st,lps22hh" appears un-documented -- check ./Documentation/devicetree/bindings/
> 		.compatible = "st,lps22hh",
> 
> Fixes: e5aab7b0d88d ("iio:st_pressure:initial lps22hh sensor support")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/st-sensors.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt b/Documentation/devicetree/bindings/iio/st-sensors.txt
> index ddcb95509599..52ee4baec6f0 100644
> --- a/Documentation/devicetree/bindings/iio/st-sensors.txt
> +++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
> @@ -77,3 +77,4 @@ Pressure sensors:
>  - st,lps22hb-press
>  - st,lps33hw
>  - st,lps35hw
> +- st,lps22hh
