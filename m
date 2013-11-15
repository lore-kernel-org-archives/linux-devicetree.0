From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC DTC PATCH] dtc: add symlink (-L) output to dtbs
Date: Fri, 15 Nov 2013 16:14:30 +0000
Message-ID: <20131115161430.E5938C408A5@trevor.secretlab.ca>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net> <
 52814AFB.3070600@wwwdotorg.org> <
 CAL_Jsq+mAoN2Lbg+uqfLMTZBvgz28E-EioiaU4BUSL_7rS5JjA@mail.gmail.com> <
 528275B7.6050209@wwwdotorg.org> <20131112193012.GR10335@titan.lakedaemon.
 net> <52828C77.20001@wwwdotorg.org> <20131114162859.GX10335@titan.
 lakedaemon.net> <52851DC8.203@wwwdotorg.org> <20131114191622.GC21549@
 obsidianresearch.com> <528542AC.4080405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <528542AC.4080405@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 14 Nov 2013 14:37:48 -0700, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 11/14/2013 12:16 PM, Jason Gunthorpe wrote:
> > On Thu, Nov 14, 2013 at 12:00:24PM -0700, Stephen Warren wrote:
> > 
> >> I don't think a distro should need to know the DTB filename at all.
> >> Rather, the/a bootloader should know which platform it's running on, and
> >> provide a variable/... to the boot script/... that defines the DTB
> >> filename. That would completely remove all the knowledge of DTB
> >> filenames from distros.
> > 
> > At some point the distro has to install a dtb into some cannonical
> > place so the bootloader can find it..
> > 
> > Are you thinking that distros will have to ship a /boot/dtbs/*.dtb
> > with every dtb from the kernel build?
> 
> Yes. How else would the distro support booting the install on arbitrary
> boards?
> 
> > What happens when you install two different versions of the kernel?
> 
> /boot/zImage-$version
> /boot/dtbs-$version/*.dtb
> 
> > What about boot schemes that can load a kernel version dependent dtb?
> 
> I think that's solved by installing the DTB files in a
> kernel-version-specific directory.

That's certainly the way I would solve it.

g.
