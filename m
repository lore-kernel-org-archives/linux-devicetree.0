From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] of: require a match on all fields of of_device_id
Date: Wed, 18 Jul 2012 01:57:53 +0000
Message-ID: <CAOZdJXVA-LAAok_weip8deTq4KER57yYAOsvY-Fm6czRYZuwzA@mail.gmail.com>
References: <20120718011151.GA6119@tyr.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120718011151.GA6119-sYzRgVcTFj7IOBva1QDFkw@public.gmane.org>
Content-Language: en-US
Content-ID: <F35DE580D8B02047953374D8EEBC2097-725oAoX4OcF2GV6JINhBVAC/G2K4zDHf@public.gmane.org>
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
To: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 17, 2012 at 8:11 PM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Commit 107a84e61cdd3406c842a0e4be7efffd3a05dba6 ("of: match by compatible
> property first") breaks the gianfar ethernet driver found on various
> Freescale PPC chips.
>
> There are, for unfortunate historical reasons, two nodes with a
> compatible of "gianfar".

Would it be worth updating the binding for the two nodes to make the
compatible property different?  We could do something like this:

ethernet@24000 {
                        reg = <0x24000 0x1000>;
                        compatible = "fsl,gianfar-eth", "gianfar";
                        ...
};

(and something similar for MDIO nodes)

and update all the drivers to look for both strings.  After a few
years, we can delete "gianfar".

-- 
Timur Tabi
Linux kernel developer at Freescale
