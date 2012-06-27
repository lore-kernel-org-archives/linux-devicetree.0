From: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v7] MTD: LPC32xx SLC NAND driver
Date: Wed, 27 Jun 2012 17:25:28 +0200
Message-ID: <4FEB25E8.5060706@antcom.de>
References: <1339064536-20553-1-git-send-email-stigge@antcom.de>
 <1340794007.29342.50.camel@sauron.fi.intel.com> <4FEAF90B.5030809@antcom.de>
 <CAAAP30HemOV9svhVghLTWfZe95=P3CT-H7UsQ=xY6rC8=AfBsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAAAP30HemOV9svhVghLTWfZe95=P3CT-H7UsQ=xY6rC8=AfBsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Alexandre Pereira da Silva <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: srinivas.bakki-3arQi8VN3Tc@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leiwen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kevin.wells-3arQi8VN3Tc@public.gmane.org, b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, hechtb-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On 06/27/2012 02:26 PM, Alexandre Pereira da Silva wrote:
> I think it's best in case of *_raw to use nand base default functions,
> like in the MLC patch.

Problem here (specific for this SLC controller) is that it expects us to
access the data register via 16bit access while the actual data is only
8bit wide.

This can't be done with the default nand functions, neither with the
8bit nor 16bit variant.

Roland

PS: Nevertheless, I will post our SLC driver update series against the
l2-mtd branch.
