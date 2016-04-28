From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V5 1/6] SLIMbus: Device management on SLIMbus
Date: Thu, 28 Apr 2016 16:59:02 +0200
Message-ID: <5047442.UXEhPc2Isi@wuerfel>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org> <7478716.z4vdp0mVTA@wuerfel> <20160428143801.GO3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160428143801.GO3217-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sagar Dharia <sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, bp-l3A5Bk7waGM@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gong.chen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, andreas.noever-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, jkosina-AlSwsSmVLrQ@public.gmane.org, sharon.dvir1-MQgwKvJRKlGYZoqfULhbRA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kheitke-hxvC4TZJLZFWk0Htik3J/w@public.gmane.org, mlocke-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sheetal.tigadoli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 28 April 2016 15:38:01 Mark Brown wrote:
> On Thu, Apr 28, 2016 at 02:33:41PM +0200, Arnd Bergmann wrote:
> > On Thursday 28 April 2016 12:53:37 Mark Brown wrote:
> > I don't foresee mobile phones with ACPI using this subsystem, but even
> > if we got them, it would be a horrible idea to use hardcoded board
> > specific tables in a platform file, and we should insist that whatever
> > firmware is present has a way to describe the slimbus devices.
> 
> Right, in this particular case I don't think it makes a huge difference
> but what you were talking about was "ancient pre-DT times" rather than
> something specific to this particular case.  That's definitely a thing
> that people keep thinking and it's good to push back on it since we do
> have non-DT cases to worry about (some architectures, other firmwares,
> things like PCI cards with other components on them and so on).

Ok, I see what you mean. It turns out I made the exact same
comment on the first review five years ago (phrased more
nicely back then):

http://thread.gmane.org/gmane.linux.documentation/3192/focus=3193

My comment this time was for the particular driver, but I'd
still also maintain that a new subsystem in general should not
start out by addressing the needs of traditional board files.
I don't think we have merge new platform support on any
architecture that would need this in the past years and
stuff like spi_board_info and i2c_board_info is only really
used on really old machines (but not going away any time soon
either).

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
