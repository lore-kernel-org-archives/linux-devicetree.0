From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] gpiolib: add gpio_export_with_name
Date: Thu, 30 May 2013 23:11:02 +0200
Message-ID: <CACRpkdZMj-Xin5PMDWavaWOTCSZF3NBWXk4fG4QXsJzhwBcs_Q@mail.gmail.com>
References: <20121121101259.GQ4398@game.jcrosoft.org>
 <1353492849-29397-1-git-send-email-plagnioj@jcrosoft.com>
 <20121126135911.2F1D33E187C@localhost> <51A719A5.50906@epfl.ch>
 <CACRpkdb9F+wJ0hkNqPTP34r3JAEp2s07Q8U24fD6oCdj7MqCFA@mail.gmail.com>
 <51A7B8CD.4080702@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51A7B8CD.4080702-p8DiymsW2f8@public.gmane.org>
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
To: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2013 at 10:38 PM, Florian Vaussard
<florian.vaussard-p8DiymsW2f8@public.gmane.org> wrote:

> Indeed, I work in a robotics lab :-) One of our board (mach-imx/
> mx31moboard*.c) controls for example the multiplexing of two cameras
> sharing the same acquisition bus (I know, a bit hackish).
> I developed a similar board with an OMAP3. Such control do not
> fit well in the above-mentioned cases, but we do not need RT processes.

It does seem to fit well with V4L and/or the media controller
framework though, or is this one of those "oh, we don't really
like to use V4L so we have this special hack instead" things?

Yours,
Linus Walleij
