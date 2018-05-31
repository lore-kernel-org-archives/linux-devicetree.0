Return-Path: <robherring2@gmail.com>
Date: Wed, 30 May 2018 19:13:51 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 01/15] dt-bindings: connector: add properties for typec
Message-ID: <20180531001351.GA6140@rob-hp-laptop>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527475967-15201-2-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 10:52:33AM +0800, Li Jun wrote:
> Add bindings supported by current typec driver, so user can pass
> all those properties via dt.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  .../bindings/connector/usb-connector.txt           | 44 +++++++++++++++
>  include/dt-bindings/usb/pd.h                       | 62 ++++++++++++++++++++++
>  2 files changed, 106 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
