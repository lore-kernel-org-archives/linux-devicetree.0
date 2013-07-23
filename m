From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v8 00/28] MBus DT binding for Armada 370/XP and Kirkwood
Date: Tue, 23 Jul 2013 10:10:31 -0700
Message-ID: <CAOesGMh5GjCkaGX1O1VdkQUKdM8z0XPEc08OFPjJcGgP6s9nRw@mail.gmail.com>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2013 at 6:31 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> After Andrew Lunn reported [1] this work need to take account of Kirkwood
> to prevent breaking PCIe on such platform, here's a new version adding
> MBus DT binding for Kirkwood and in particular using it to declare PCIe
> properly.

Ezequiel,

This is a prime example of someone sending a whole patch series to the
devicetree mailing list, when only the bindings updates should go
there. There are a lot of readers of the devicetree lists that can't
keep up with the volume of email due to this reason.

So, while I'm commenting on your email, this goes for everybody
mailing to this list (and I expect to repeat myself a few times in the
weeks and months ahead): Do not post the driver updates to the
devicetree list, only the bindings updates.


-Olof
