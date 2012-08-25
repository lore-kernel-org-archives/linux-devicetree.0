From: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCH V5] mtd: m25p80: Make fast read configurable via DT
Date: Sat, 25 Aug 2012 15:06:46 -0700
Message-ID: <CAJiQ=7BCaV7jx9yjJiEQ8RUuqHdUV0x7_gxZM97KKytVVS3ZUA@mail.gmail.com>
References: <1345923416-9293-1-git-send-email-marex@denx.de>
 <CAJiQ=7BAH_87jrDCG=Jbw7ezsezFWrBv+eUkoH5jGmeV9tQiYQ@mail.gmail.com>
 <201208252240.54932.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <201208252240.54932.marex@denx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marex@denx.de>
Cc: David Woodhouse <david.woodhouse@intel.com>, dedekind1@gmail.com, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, devicetree-discuss@lists.ozlabs.org, robherring2@gmail.com, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Aug 25, 2012 at 1:40 PM, Marek Vasut <marex@denx.de> wrote:
>> Are there any modern SPI flash parts that can't handle FAST_READ, or
>> is this mostly for compatibility with legacy systems?
>
> We have to support all possibilities, not only "modern systems" .

If the !FAST_READ option only exists to support a tiny number of rare,
ancient flash chips, then it's probably worth pointing that out to the
user in the help text.  Similar to "most users will say 'N' here" in
Kconfig.  Or the help text for CONFIG_MTD_NAND_MUSEUM_IDS.

> Good, but I don't see it supported in the driver, how is this different from
> MX25L256E?

> They can be added as additional DT props, that should be easy.

It's easy to add new features to m25p80, but it's hard to change DT
properties once they are widely used.  They will be baked into
bootloader images and could be utilized by non-Linux operating
systems.

If we already know today that a boolean property is insufficient for
current generations of SPI flash chips, it would not be a good thing
to write it in stone now and be forced to hack around it later.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
