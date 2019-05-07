From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 01/10] media: dt-bindings: marvell,mmp2-ccic: Add
 Marvell MMP2 camera
Date: Tue, 7 May 2019 12:09:32 -0500
Message-ID: <20190507170932.GA6587@bogus>
References: <20190505140031.9636-1-lkundrak@v3.sk>
 <20190505140031.9636-2-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190505140031.9636-2-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>, Libin Yang <lbyang@marvell.com>, Albert Wang <twang13@marvell.com>, jacopo mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@iki.fi>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

On Sun,  5 May 2019 16:00:22 +0200, Lubomir Rintel wrote:
> Add Marvell MMP2 camera host interface.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v4:
> - s/Nust/Must/
> - Documented required endpoint properties; bus-type, hsync-active,
>   vsync-active and pclk-sample.
> 
> Changes since v3:
> - Dropped the video-interfaces.txt reference
> - Clarify "clocks", "clock-names" and "clock-output-names" descriptions
> - Refer to other documentation by full path
> 
> Changes since v2:
> - Added #clock-cells, clock-names, port
> 
>  .../bindings/media/marvell,mmp2-ccic.txt      | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
