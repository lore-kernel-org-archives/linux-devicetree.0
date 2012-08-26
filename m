From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V5] mtd: m25p80: Make fast read configurable via DT
Date: Sun, 26 Aug 2012 11:11:52 +0200
Message-ID: <201208261111.52887.marex@denx.de>
References: <1345923416-9293-1-git-send-email-marex@denx.de>
 <201208252240.54932.marex@denx.de>
 <CAJiQ=7BCaV7jx9yjJiEQ8RUuqHdUV0x7_gxZM97KKytVVS3ZUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAJiQ=7BCaV7jx9yjJiEQ8RUuqHdUV0x7_gxZM97KKytVVS3ZUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <david.woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Kevin Cernekee,

> On Sat, Aug 25, 2012 at 1:40 PM, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:
> >> Are there any modern SPI flash parts that can't handle FAST_READ, or
> >> is this mostly for compatibility with legacy systems?
> > 
> > We have to support all possibilities, not only "modern systems" .
> 
> If the !FAST_READ option only exists to support a tiny number of rare,
> ancient flash chips, then it's probably worth pointing that out to the
> user in the help text.  Similar to "most users will say 'N' here" in
> Kconfig.  Or the help text for CONFIG_MTD_NAND_MUSEUM_IDS.
> 
> > Good, but I don't see it supported in the driver, how is this different
> > from MX25L256E?
> > 
> > They can be added as additional DT props, that should be easy.
> 
> It's easy to add new features to m25p80, but it's hard to change DT
> properties once they are widely used.  They will be baked into
> bootloader images and could be utilized by non-Linux operating
> systems.
> 
> If we already know today that a boolean property is insufficient for
> current generations of SPI flash chips, it would not be a good thing
> to write it in stone now and be forced to hack around it later.

Actually, fast read opcode will always be fast read opcode. I do see your 
concern, but then, until there is a way to probe for supported opcodes and 
features, you'll end up having to describe your chip properly.

Of course, the list of IDs built into Linux is cool and can be used to toggle 
the fast read I think, but what about running older linux kernel with a new chip 
it doesn't support? The DT props could be easily used to describe even the new 
chip then and there won't be any problem -- compared to "internal ID table".

Best regards,
Marek Vasut
