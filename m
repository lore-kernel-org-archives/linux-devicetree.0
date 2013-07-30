From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [RFC PATCH 0/2] impedance-matcher generic improvements
Date: Tue, 30 Jul 2013 09:17:25 -0400
Message-ID: <20130730131725.GC5882@titan.lakedaemon.net>
References: <51F2A014.7000209@gmail.com>
 <cover.1375131816.git.jason@lakedaemon.net>
 <51F76FE3.1080302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <51F76FE3.1080302@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Mack <zonque@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Nicolas Pitre <nico@fluxnic.net>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 30, 2013 at 09:48:51AM +0200, Daniel Mack wrote:
> Hi Jason,
> 
> On 29.07.2013 23:23, Jason Cooper wrote:
> > Basic idea is to replace a device's stock kernel with this impedance-matcher.
> > Load the kernel and/or the devicetree blob to desired addresses.  Add
> > 'loadaddrs=0xXXXXXXXX,0xYYYYYYYY' to the kernel's command line.  Or, if you are
> > appending, 'loadaddrs=appended,0xYYYYYYYY'.  First address is the location of
> > the kernel, second is the location of the dtb.
> 
> Nice to see that idea implemented! For me though, changing any of the
> U-Boot variables is out of the question, and I need the matcher just the
> way I implemented it, including the LED blink pattern to let the user
> know if things go wrong.

Understandable.  After thinking about it a bit, I think I'm going to
rework this patch to allow appending both kernels and dtbs (as you had),
and abstract out the led blink so that your code would become a compile
time option.

> Hence, I won't change to your generic version on my boards, and so I
> think it might be best if you maintain your own tree for your approach.

hrmmm, I don't like forking on general principle.  Let me do the above
rework and see if that works for you, while adding the capabilities I
need.

When I'm done, you should just be able to do:

  $ make APPEND_KERNEL=input/zImage APPEND_DTBS=input/*.dtb uImage

And get the same result.

In the meantime, would you mind adding a license to your code?  If you
have no preference, I like GPLv2-only, but it's your code, so whatever
you like.

thx,

Jason.
