From: Paul Brook <paul@codesourcery.com>
Subject: Re: [RFC] Machine description as data
Date: Thu, 12 Feb 2009 23:58:25 +0000
Message-ID: <200902122358.25864.paul@codesourcery.com>
References: <20090212040138.GD31142@yookeroo.seuss>
	<20090212.094613.514366467.imp@bsdimp.com>
	<4994B22E.6060608@gmx.net>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <4994B22E.6060608@gmx.net>
Content-Disposition: inline
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: qemu-devel@nongnu.org
Cc: devicetree-discuss@ozlabs.org, Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>, hollisb@us.ibm.com
List-Id: devicetree@vger.kernel.org

> Unless I'm mistaken, Linux is able to probe most hardware properties.

You are badly mistaken.

On x86 workstation/server class hardware you might get away with it because 
everything interesting is either  standard legacy ports or PCI, and your 
firmware/bios already took care of the really hairy bits.

On embedded systems there's often very little that can be automatically 
detected, much less functionality provided by the firmware (You're lucky if 
all your RAM is even turned on!) and you just have to know where stuff is.

Paul
