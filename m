From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v4 03/10] pinctrl: mvebu: kirkwood pinctrl driver
Date: Sun, 16 Sep 2012 09:46:52 +0200
Message-ID: <20120916074652.GM28177@lunn.ch>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1347550912-18021-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1347550912-18021-4-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1347550912-18021-4-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> +++ b/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-pinctrl.txt
> @@ -0,0 +1,279 @@
> +* Marvell Kirkwood SoC pinctrl driver for mpp
> +
> +Please refer to marvell,mvebu-pinctrl.txt in this directory for common binding
> +part and usage.
> +
> +Required properties:
> +- compatible: "marvell,88f6180-pinctrl",
> +              "marvell,88f6190-pinctrl", "marvell,88f6192-pinctrl",
> +              "marvell,88f6281-pinctrl", "marvell,88f6282-pinctrl"
> +
> +This driver supports all kirkwood variants, i.e. 88f6180, 88f619x, and 88f628

Hi Sebastian 

The current MPP code determines for itself what chip it is running on.
It can then check if a pin configuration is valid for the current
run time environment.

Here you are suggesting we have to put into the DT what chip we expect
to be on.

What is the advantage of this, over getting the information from the
device itself?

If i wanted to mass convert all existing kirkwood DT boards over to
use pinctrl, im stuck at the very first step. I've no idea what chip
they use, it was not relevant before.

Thanks
	Andrew
