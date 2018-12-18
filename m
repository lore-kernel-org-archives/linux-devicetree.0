From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/4] media: dt-bindings: Add binding for si470x radio
Date: Tue, 18 Dec 2018 10:13:41 -0600
Message-ID: <20181218161341.GA5282@bogus>
References: <20181207135812.12842-1-pawel.mikolaj.chmiel@gmail.com>
 <20181207135812.12842-5-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181207135812.12842-5-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, hverkuil@xs4all.nl, fischerdouglasc@gmail.com, keescook@chromium.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri,  7 Dec 2018 14:58:12 +0100, =?UTF-8?q?Pawe=C5=82=20Chmiel?= wrote:
> Add device tree bindings for si470x family radio receiver driver.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> Changes from v1:
> 	- squashed with patch adding reset-gpio documentation
> ---
>  .../devicetree/bindings/media/si470x.txt      | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/si470x.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
