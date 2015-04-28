From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 2/3 v5] mailbox: Enable BCM2835 mailbox support
Date: Tue, 28 Apr 2015 11:50:25 +0200
Message-ID: <1430214625.3948.28.camel@v3.sk>
References: <1430173644-19099-1-git-send-email-eric@anholt.net>
 <1430173644-19099-3-git-send-email-eric@anholt.net>
 <CABb+yY2u_v1uSDrBgP2DRAOrDkXETfs_zmLACm=uRFALVYFjmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY2u_v1uSDrBgP2DRAOrDkXETfs_zmLACm=uRFALVYFjmA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Devicetree List <devicetree@vger.kernel.org>, Craig McGeachie <slapdau@yahoo.com.au>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-04-28 at 11:13 +0530, Jassi Brar wrote:
> On Tue, Apr 28, 2015 at 3:57 AM, Eric Anholt <eric@anholt.net> wrote:
> > From: Lubomir Rintel <lkundrak@v3.sk>
> > 
> > Implement BCM2835 mailbox support as a device registered with the
> > general purpose mailbox framework. Implementation based on commits 
> > by
> > Lubomir Rintel [1], Suman Anna and Jassi Brar [2] on which to base 
> > the
> > implementation.
> > 
> > [1] http://lists.infradead.org/pipermail/linux-rpi-kernel/2013
> > -April/000528.html
> > [2] http://lists.infradead.org/pipermail/linux-rpi-kernel/2013
> > -May/000546.html
> > 
> We could probably drop the history from changelog. Just talk about
> what the controller is and any specifics of the driver.
> 
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > Signed-off-by: Craig McGeachie <slapdau@yahoo.com.au>
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
> > 
> 
> How come it has my s-o-b?

A good question. Seems like I've added it, but I can't really remember
or explain that:

http://lists.infradead.org/pipermail/linux-rpi-kernel/2014
-October/001006.html

It doesn't seem like I've squashed any commit with S-o-b by Jassi Brar
or Suman Anna in. Maybe I intended to add a Cc: and pasted in a S-o-b
by accident? I'm sorry for that.

Please remove the two.

Thank you,
Lubo
