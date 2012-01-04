From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: imx6q: add support for IRAM
Date: Wed, 4 Jan 2012 12:12:07 +0100
Message-ID: <CACRpkdZ6q2T5aV7GncT+Uk2p69zH0RKDFzpAPTnn9_n=Wm5a2g@mail.gmail.com>
References: <1324898123-13973-1-git-send-email-jason.chen@linaro.org>
 <20111226134129.GA9014@S2100-06.ap.freescale.net>
 <20120103091015.GD2914@n2100.arm.linux.org.uk>
 <20120103124355.GC13477@S2100-06.ap.freescale.net>
 <20120103124136.GQ2914@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120103124136.GQ2914-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jason Chen <jason.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 3, 2012 at 1:41 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Tue, Jan 03, 2012 at 08:43:56PM +0800, Shawn Guo wrote:
>> On Tue, Jan 03, 2012 at 09:10:15AM +0000, Russell King - ARM Linux wrote:
>> > Why is this even specific to fsl? =A0Isn't it something that could be
>> > specified in a totally generic way?
>> >
>> > As I showed with my original set of sram patches, there is not much
>> > specific about this on-board RAM: what is specific is how a SoC uses
>> > it, and that's up to the rest of the SoC code.
>> >
>> As I have not seen any news/updates about the sram consolidation series
>> since May, I did not bring up it here. =A0So what's the state of the
>> series? =A0If it shows up on some stable branch, we would be happy to
>> base the work here on it.
>
> I have no idea; as I've already said, I lost total interest in it.
>
> What I _am_ saying though is that rather than defining some platform
> specific bindings and continuing that idiotic state of affairs, we
> have the chance to do things properly now: define a standard set of
> DT bindings to describe on-board SRAM.
>
> That's something which can be done with or without the sram
> consolidation stuff.

I second this. It's just a piece of RAM, it should be described
the same way irrespective of system or even OS.

On-chip RAM is yet another area where platforms and their
maintainers sometimes think they are very different - just like
everyone else.

(This connects to the other IRAM patch floating on the list.)

Yours,
Linus Walleij
