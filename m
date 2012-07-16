From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH 0/8] ARM: support for Moschip MCS814x SoCs
Date: Mon, 16 Jul 2012 14:09:35 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1207161402320.14068@xanadu.home>
References: <1342363754-30808-1-git-send-email-florian@openwrt.org>
 <201207151959.19620.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <201207151959.19620.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 15 Jul 2012, Arnd Bergmann wrote:

> On Sunday 15 July 2012, Florian Fainelli wrote:
> > This patchset adds basic support for Mocship MCS814x, and in particular
> > MCS8140, and allows one booting to user space. Two off-the-shelf boards
> > are support: Tigal/Robotech RBT-832 and Devolo dLAN USB Extender.
> > 
> > Support for other on-board peripherals will obviously be contributed later
> > once the basic SoC support has been accepted.
> 
> Hi Florian,
> 
> This looks quite nice at first sight, but I have to say that your timing
> is rather unfortunate. We're getting rather close to the 3.6 merge window,
> so there is not much time to review the platform thoroughly before that
> and I'd feel more comfortable about putting it into 3.7. I'll let others
> weigh in, too. At least there is no risk of regressions for a new platform
> getting added, so if other people think we should take it for 3.5, I might
> get convinced.

You should take it if no apparent issues are found.  As you say, this 
might even be broken and no one else would be affected.  The only 
reasons I would not push it upstream are about the code i.e if the code 
causes merge conflicts, isn't up to date with the latest kernel 
infrastructures or has coding style issues, etc.


Nicolas
