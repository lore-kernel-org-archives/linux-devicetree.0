From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] bindings: rename links to mason USB2/USB3 DT files
Date: Wed, 02 Oct 2019 09:19:30 -0500
Message-ID: <5d94b1f5.1c69fb81.40e1e.4206@mx.google.com>
References: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org> <9ca2d136a1f79c878fff1208f9b536b0b613c0d5.1569330078.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9ca2d136a1f79c878fff1208f9b536b0b613c0d5.1569330078.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, corbet@lwn.net, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 24 Sep 2019 10:01:29 -0300, Mauro Carvalho Chehab wrote:
> Those files got renamed, but another DT file still points to the older
> places.
> 
> Fixes: 87a55485f2fc ("dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to yaml")
> Fixes: da86d286cce8 ("dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/amlogic,dwc3.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
