From: viresh kumar <viresh.linux@gmail.com>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Wed, 21 Mar 2012 18:58:41 +0530
Message-ID: <CAOh2x==J4qkp29w+v=GWORBua-DE3yb0MRGOtBLyELxbGZwcuA@mail.gmail.com>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <201203151339.36173.arnd@arndb.de> <4F69BC35.4010400@st.com>
 <201203211236.37891.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201203211236.37891.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stefan Roese <sr@denx.de>, spear-devel <spear-devel@list.st.com>, "devicetree-discuss@ozlabs.org" <devicetree-discuss@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 21, 2012 at 6:06 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> Let's make sure we're on the same page with the process though. I hope
> you're aware that I took Stefan's spear6xx v5 patch.

Ya. I already know that. :)

> Just let me know how you want to handle
> these things in the future -- the normal way would be to always let you
> forward the patches to me, rather than having them applied to arm-soc
> directly.

Hmmm. I don't know how exactly it works, but maybe you can add me as
an custodian for SPEAr, with a git repo somewhere in kernel.org (?).
So that i can apply patches directly to my branch, you pull it.
What do you say?

> I think spear is simple and clean enough that it can serve as an example
> for others doing DT conversion. Do you also plan to unify 3xx and 6xx?
> I think there is hardly anything left in mach-spear6xx that justifies
> having a separate platform, especially since with the DT conversion done,
> we can actually remove most of the header file contents as well.

I issue with us was that we were not able to push stuff mainline in time and
were too busy supporting customers.

We have lot of patches locally, that we would like to upstream. But it
can't happen
without updating it with new expectations of list. I actually wanted
to ask you few
things:

- DT: Obviously we would have this in our patches
- Pinmux: I would remove our padmux and use pinmux, but what about its
DT support.
  I know stephen had few patches for it, but don't know there
progress. I don't want to
  do stuff twice. First add support for it in board and the *.dts files.
- Clock Framework: Is common clock framework ready for use or can we update our
  local clock framework?

I will see if merging 3xx & 6xx is feasible. If yes, then i will
surely move in that direction.
I always like cleaning stuff. :)

I would be adding 13xx (cortex-A9) patches again later, once done with 3xx.

--
viresh
