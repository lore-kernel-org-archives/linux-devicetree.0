From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARM: mach-ux500|nomadik|u300: Align to common DT
 bindings for mmci
Date: Mon, 17 Mar 2014 16:15:09 +0000
Message-ID: <20140317161509.GA32708@e106331-lin.cambridge.arm.com>
References: <1394713963-18300-1-git-send-email-ulf.hansson@linaro.org>
 <20140313174703.GO21483@n2100.arm.linux.org.uk>
 <CAPDyKFrw092mbirDBffF6TraUoXDLh5movp_sf9PYERG88P-Qw@mail.gmail.com>
 <CACRpkdZzObyJQmbAvovcor9NXeVnhEFO82jtxLZOdm48TPnudQ@mail.gmail.com>
 <CAPDyKFpJDKXK7siVMnB5umv6PnYAyNmto1yq9unxDaD9BP=oBQ@mail.gmail.com>
 <CACRpkdYPHkEMBu7KMp25veTfXtpWZOOz39n-+jCZ+hTQMK2=Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYPHkEMBu7KMp25veTfXtpWZOOz39n-+jCZ+hTQMK2=Tw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alessandro Rubini <rubini@unipv.it>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 17, 2014 at 02:00:58PM +0000, Linus Walleij wrote:
> On Mon, Mar 17, 2014 at 11:01 AM, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On 14 March 2014 11:58, Linus Walleij <linus.walleij@linaro.org> wrote:
> >> On Fri, Mar 14, 2014 at 8:27 AM, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >>> On 13 March 2014 18:47, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> 
> >>>> NAK.  These bindings have been documented as being there since March
> >>>> 14th 2012, and therefore need to be supported for ever by the driver.
> >>>> You can _augment_ the bindings with the generic ones, and change the
> >>>> DT files, but you can't remove the parsing of the old property names.
> >>>
> >>> I was kind of expecting this response. :-)
> >>>
> >>> So, since we made a mistake about adding these DT bindings we are now
> >>> unable to remove them, is there really no way back?
> >>>
> >>> In this particular case, I am confident that it should be safe to
> >>> remove them, but I guess this is more matter of principle, right?

Basically, yes.

Our default position is to not break existing DTBs. In general that's
beneficial, ensures stability, and keeps people in the right mindset.
Sticking to the position even where we could be a little softer is a way
of keeping people honest -- practically everyone has a binding (or
seventy) which they hate and would love to change, sticking to the rules
(even when painful) saves us from endless churn for little benefit.

In this case the binding isn't broken; it provides the information we
need, but just not with our preferred names. As Russell has pointed out,
we can support the more standard names in addition to the current ones
(which we can deprecate for new DTs). Forcibly breaking existing DTBs is
not necessary, and I'm not sure if it's worthwhile for the sake of a few
bytes.

There are bindings out there which are fundamentally broken, which are
always reliant on platform data or just don't currently work. Those are
what we need to focus on fixing to ensure long-term support.

We also need a strategy for binding deprecation, which we do not have
currently. There was talk of unstable bindings at the last mini-summit
to allow people to tinker without committing to long-term support of
bindings, but nothing seems to have happened on that front. It would be
nice to have a plan for dealing with all these vestigal bits long term.

Thanks,
Mark.
