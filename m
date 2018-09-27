From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 2/3] dt-bindings: firmware: coreboot: document board
 variant properties
Date: Thu, 27 Sep 2018 14:48:51 -0700
Message-ID: <CA+ASDXMMyz+uva9++kih+t9k2W+hFtA5E-Fmd8b_TwrY2N0LFg@mail.gmail.com>
References: <20180822120214.11848-1-heiko@sntech.de>
 <20180822120214.11848-2-heiko@sntech.de>
 <20180831121836.GA23441@bogus> <1660300.IG1gbB27SJ@phil>
 <20180925163927.GA23163@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180925163927.GA23163@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandru M Stan <amstan@chromium.org>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 9:39 AM Rob Herring <robh@kernel.org> wrote:
> Reading strapping values and putting into DT seems like a perfectly
> reasonable thing to do (I'm assuming the pins get initialized to their
> function and reading them later is not possible), but that has nothing
> to do coreboot really. We don't put things u-boot touches under a u-boot
> node. These should go at the top-level IMO.

Where, exactly? Do you have a suggested property name?

Regarding compatible-based approach (from prior email): we do heavily
use the top-level 'compatible' property too for a similar purpose, but
sometimes there's a useful difference between "I booted with DTB
<foo>, which is compatible with revision X, Y, Z, ..." and "the exact
revision I booted is N". So the properties are definitely useful.

> And maybe it is compelling to just take them having been in use for some
> time on widely deploying devices, but that's not really good precedence.

Well, we ain't changing the old firmware. Coming up with a new name
can work, and we can modify new firmware to start doing both. But it'd
still probably be wise to note what's actively in-use, especially if
it's not substantively different than what we settle on.

Brian
