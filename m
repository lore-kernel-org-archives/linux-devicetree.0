Return-Path: <robherring2@gmail.com>
Date: Mon, 26 Mar 2018 17:25:07 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: usb: fusb302: remove max-sink-*
 properties
Message-ID: <20180326222507.bujgmllb3opjcihq@rob-hp-laptop>
References: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
 <1521817127-23061-4-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521817127-23061-4-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, hdegoede@redhat.com, linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 23, 2018 at 10:58:45PM +0800, Li Jun wrote:
> Remove max-sink-* properties since they are deprecated.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/fcs,fusb302.txt | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
