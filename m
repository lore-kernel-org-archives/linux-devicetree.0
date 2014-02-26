From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/10] pinctrl: mvebu: remove hard-coded addresses from
 Dove pinctrl
Date: Wed, 26 Feb 2014 10:43:45 +0100
Message-ID: <CACRpkdYQa2BG_qxf5zY=7rks6O31ZF-BX0af3_u1MOgwfwxFSQ@mail.gmail.com>
References: <1393231382-11078-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<20140224181023.GA1010@titan.lakedaemon.net>
	<CACRpkdZ+YGTyDj6i8c198MdRtz3GY-YBmVO9LysPCcmT4EC0cg@mail.gmail.com>
	<20140226000940.GF1872@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140226000940.GF1872@titan.lakedaemon.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 26, 2014 at 1:09 AM, Jason Cooper <jason@lakedaemon.net> wrote:

> Sebastian has now re-organized the branches as I asked, and I confirmed
> that the final result is the exact same as mine (diff is null).

Okay!

> Usually when I submit pull requests to arm-soc, they like to see the
> branches.  That way if there is an error in one of them, they just drop
> the one branch and the others remain.
>
> Would you like them the same way?  If so, I'll send the pulls to you
> tomorrow.

Send me one big branch with everything on it. Actually, I'd prefer
to pull it in, rebase and sign off each patch individually in my tree
if that is not causing you problems. That way it is visible that the
patches were funneled through pin control.

Yours,
Linus Walleij
