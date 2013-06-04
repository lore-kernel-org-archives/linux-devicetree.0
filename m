From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DT version of kirkwood_ge0x_init()
Date: Tue, 04 Jun 2013 12:34:42 +0200
Message-ID: <51ADC2C2.6010106@gmail.com>
References: <51ADBEE0.5040500@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51ADBEE0.5040500-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
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
To: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "Longchamp, Valentin" <Valentin.Longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "Brunck,
 Holger" <Holger.Brunck-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, Simon Guinot <simon-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/04/13 12:18, Gerlando Falauto wrote:
> I noticed how most of the DT-aware board-setup files only have a single
> <board>_init() function, calling kirkwood_ge00_init() with a struct
> mv643xx_eth_platform_data as a single argument.
>
> I was wondering -- is there a reason why we cannot remove all this
> board-specific code and move all this to the DT?

Gerlando,

DT for mv643xx_eth is on the way (https://lkml.org/lkml/2013/5/29/527).
We wait for the driver to surface to relax branch dependencies and then
move all DT Orion SoCs to it.

 > I would really love to have all our boards under a single
 > CONFIG_<FAMILY>_DT and a single compatible string, with all the
 > differences within the DTs itself -- no more #ifdef CONFIG_<BOARD>,
 > no more of_machine_is_compatible("boardXXX").

All those will happen if there is DT support for mv643xx_eth which
is the only driver left without DT and board dependencies. But there
will be no CONFIG_LACIE_DT or whatever, but just CONFIG_KIRKWOOD_DT
and board dependent stuff described in the corresponding dts.

Sebastian
