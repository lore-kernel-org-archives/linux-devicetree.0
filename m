From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add vendor prefix for Kionix, Inc.
Date: Sat, 9 Mar 2019 18:13:54 +0000
Message-ID: <20190309181354.4b455353@archlinux>
References: <20190304151912.11485-1-decatf@gmail.com>
        <20190304151912.11485-2-decatf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304151912.11485-2-decatf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Yang <decatf@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  4 Mar 2019 10:19:10 -0500
Robert Yang <decatf@gmail.com> wrote:

> Kionix manufactured MEMs sensors. There are Kionix acceleromoter sensor
> drivers which can be used with device tree.
> 
> Signed-off-by: Robert Yang <decatf@gmail.com>
I'll apply these now before I forget them but if a DT person
wants to comment I won't be pushing out as non rebasing for
at least a week so plenty of time!

Applied to the togreg branch of iio.git but pushed out for
now as testing for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index bb6f6e8a2eee..e389904ee9bf 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -210,6 +210,7 @@ kiebackpeter    Kieback & Peter GmbH
>  kinetic Kinetic Technologies
>  kingdisplay	King & Display Technology Co., Ltd.
>  kingnovel	Kingnovel Technology Co., Ltd.
> +kionix	Kionix, Inc.
>  koe	Kaohsiung Opto-Electronics Inc.
>  kosagi	Sutajio Ko-Usagi PTE Ltd.
>  kyo	Kyocera Corporation
