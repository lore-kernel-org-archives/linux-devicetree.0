From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 08/10] ARM: u300: convert to MULTI_IRQ_HANDLER
Date: Wed, 28 Sep 2011 14:18:14 +0200
Message-ID: <CACRpkdarydeYAyOV8Cm134TtPeh9_qFSqWPkvpZjUE9yPNNtJA@mail.gmail.com>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
	<1317206507-18867-9-git-send-email-jamie@jamieiles.com>
	<CACRpkdYOdWA2vg2zq+nhOPSvPN7zdy9NVsOcqfZ7i9W5Sq5cpw@mail.gmail.com>
	<20110928120340.GH17204@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110928120340.GH17204-apL1N+EY0C9YtYNIL7UdTEEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: viresh.kumar-qxv4g6HH51o@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, rajeev-dlh.kumar-qxv4g6HH51o@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, STEricsson_nomadik_linux-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, rubini-9wsNiZum9E8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2011 at 2:03 PM, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:

>> vic_single_handle_irq() needs to be modified to handle several
>> ranges or atleast two.
>
> The platform IRQ handler is actually vic_handle_irq() that internally
> calls vic_single_handle_irq() for each registered vic (in the order of
> registration).

Ah I get it I'm dead wrong as usual :-)

I tried to apply them to test but Iget into dependency trouble with
the referenced required patches, do you have some handy
git branch with all stuff applied in order that I can pull in and
test off?

Yours,
Linus Walleij
