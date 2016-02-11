From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: breaking DT compatibility
Date: Thu, 11 Feb 2016 15:16:29 +0000
Message-ID: <56BCA5CD.3080008@arm.com>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <56B4E2FB.3050703@arm.com> <56BB2D79.6090402@arm.com>
 <CABGGiswOKztmRT40w4t_7BD729WgM8ueLtOD-UF_wgMbmcg4cg@mail.gmail.com>
 <20160210143755.GE31506@lukather> <20160210163001.GG2632@leverpostej>
 <20160211100048.GK31506@lukather>
 <20160211145158.GA8824@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160211145158.GA8824@localhost.localdomain>
Sender: linux-clk-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rob Herring <rob.herring@linaro.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Jens Kuske <jenskuske@gmail.com>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 11/02/16 14:51, Richard Cochran wrote:
> On Thu, Feb 11, 2016 at 11:00:48AM +0100, Maxime Ripard wrote:
>> None of our existing users ever complained.
> 
> Note to self:
> 
>    Avoid choosing this SoC for new projects.  The maintainers do not
>    care about the end users.

Now that's a bit harsh, I think.
Maxime is doing a great job for maintaining this admittedly not very
well architected and documented SoC "family" - in his spare time.

Also the actual end user experience is probably just fine (despite
broken DT compatibility), since on these storage-less boards the
distributions usually ship DT, firmware (U-Boot) and kernel bundled
together.
This does not qualify for breaking the DT deliberately, but we are about
to fix this as we speak.

Also my concern was just that I wanted to move away from this being the
only way of running Linux on those boards.

We may think about collecting DTBs and firmware for those boards in a
central place without direct connection to a certain Linux version or
distribution. This would make the whole idea more visible and would make
compatibility breaks more evident.

Cheers,
Andre.
