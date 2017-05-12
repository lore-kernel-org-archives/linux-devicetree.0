From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCHv2 0/3] Intel FPGA VIP Frame Buffer II DRM Driver
Date: Fri, 12 May 2017 08:51:38 +0200
Message-ID: <20170512065138.hp6nkmvko3d6shv5@phenom.ffwll.local>
References: <1493086006-4392-1-git-send-email-hean.loong.ong@intel.com>
 <87shklznuo.fsf@eliezer.anholt.net>
 <1493861983.2182.11.camel@intel.com>
 <87lgqcsg18.fsf@eliezer.anholt.net>
 <1494209010.2533.4.camel@intel.com>
 <87efvz2v4m.fsf@eliezer.anholt.net>
 <1494300270.5383.29.camel@intel.com>
 <8760hanfua.fsf@eliezer.anholt.net>
 <1494471040.2062.16.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1494471040.2062.16.camel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org" <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, "dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Vetter, Daniel" <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Loh, Tien Hock" <tien.hock.loh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 11, 2017 at 02:50:41AM +0000, Ong, Hean Loong wrote:
> On Tue, 2017-05-09 at 09:40 -0700, Eric Anholt wrote:
> > "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
> > 
> > > 
> > > On Mon, 2017-05-08 at 09:03 -0700, Eric Anholt wrote:
> > > > 
> > > > "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
> > > > 
> > > > > 
> > > > > 
> > > > > On Thu, 2017-05-04 at 10:11 -0700, Eric Anholt wrote:
> > > > > > 
> > > > > > 
> > > > > > "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
> > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > On Wed, 2017-05-03 at 13:28 -0700, Eric Anholt wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org writes:
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > From: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > > > > > > > > 
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > The new Intel Arria10 SOC FPGA devkit has a Display
> > > > > > > > > Port IP
> > > > > > > > > component 
> > > > > > > > > which requires a new driver. This is a virtual driver
> > > > > > > > > in
> > > > > > > > > which
> > > > > > > > > the
> > > > > > > > > FGPA hardware would enable the Display Port based on
> > > > > > > > > the
> > > > > > > > > information
> > > > > > > > > and data provided from the DRM frame buffer from the
> > > > > > > > > OS.
> > > > > > > > > Basically
> > > > > > > > > all
> > > > > > > > > all information with reagrds to resolution and bits per
> > > > > > > > > pixel
> > > > > > > > > are
> > > > > > > > > pre-configured on the FPGA design and these information
> > > > > > > > > are
> > > > > > > > > fed
> > > > > > > > > to
> > > > > > > > > the driver via the device tree information as part of
> > > > > > > > > the
> > > > > > > > > hardware 
> > > > > > > > > information.
> > > > > > > > I started reviewing the code, but I want to make sure I
> > > > > > > > understand
> > > > > > > > what's going on:
> > > > > > > > 
> > > > > > > > This IP core isn't displaying contents from system memory
> > > > > > > > on
> > > > > > > > some
> > > > > > > > sort
> > > > > > > > of actual physical display, right?  It's a core that
> > > > > > > > takes
> > > > > > > > some
> > > > > > > > input
> > > > > > > > video stream (not described in the DT or in this driver)
> > > > > > > > and
> > > > > > > > stores
> > > > > > > > it
> > > > > > > > to memory?
> > > > > > > If the IP Core you are referring to is some form of GPU
> > > > > > > then in
> > > > > > > this
> > > > > > > case we are using the Intel FPGA Display Port Framebuffer
> > > > > > > IP.
> > > > > > > It
> > > > > > > does
> > > > > > > display contents streamed from the ARM/Linux system to the
> > > > > > > Display
> > > > > > > Port
> > > > > > > of the physical Monitor.
> > > > > > > 
> > > > > > > Below a simple illustration of the system:
> > > > > > > 
> > > > > > > ARM/Linux --DMA-->Intel FPGA Display Port Framebuffer IP
> > > > > > > 				|
> > > > > > > 				|
> > > > > > > 			Physical Connection
> > > > > > > 			Display Port
> > > > > > The "DMA" in this diagram is the frame reader IP, right?  The
> > > > > > frame
> > > > > > reader, as described in the spec, sounds approximately like a
> > > > > > DRM
> > > > > > plane,
> > > > > > so if you have that in your system then that needs to be part
> > > > > > of
> > > > > > this
> > > > > > DRM driver (otherwise you won't be putting the right things
> > > > > > on
> > > > > > the
> > > > > > screen!).
> > > > > Would the drm_simple_display_pipe_init be able to handle this ?
> > > > > It
> > > > > seems to be displaying the proper images on screen, based on my
> > > > > current
> > > > > changes. There were recommendations to use the
> > > > > drm_simple_display_pipe_init instead of creating the CRTC and
> > > > > planes
> > > > > myself
> > > > The docs I've read for the Frame Buffer IP don't fit into any
> > > > current
> > > > DRM component, since it's what we're currently calling a
> > > > "writeback
> > > > connector".
> > > > 
> > > While running my own test (since the intel-gpu-tools doesn't seems
> > > applicable.) The drm_simple_display_pipe_init seems to be simple
> > > enough
> > > for displaying a matchbox console. The use case for this driver is
> > > only
> > > part of the enablemennt of the reference design board so that users
> > > of
> > > the Arria10 devkit can use this as base for their own designs.
> > > 
> > > > 
> > > > I don't understand your system enough to answer.  You didn't
> > > > answer
> > > > if
> > > > the "DMA" block you diagrammed was the frame reader IP (or maybe
> > > > the
> > > > frame reader IP comes after).  I also don't see how the frame
> > > > buffer
> > > > IP
> > > > could possibly be connected directly to a physical display
> > > > connector.
> > > The FPGA FrameBuffer 2 soft IP reads the information provided to it
> > > from the Linux Kernel via the platform device register provided in
> > > the
> > > DT. The Linux driver here allocates a chunk of coherent memory that
> > > directly maps to the SDRAM. The FPGA soft IP would stream the
> > > display
> > > out to the Display Port based on the information that was written
> > > to
> > > the SDRAM.
> > Your "FPGA soft IP" that's reading pixels from an area of memory (a
> > DRM
> > plane does this) and outputting that to a display port (a DRM CRTC
> > and
> > encoder does this) would make a lot of sense as a DRM driver.
> > 
> > However, this piece of hardware that takes in pixels in a stream from
> > elsewhere and stores it to memory doesn't make sense to me as a DRM
> > driver.
> > 
> > I can't really offer more advice until I understand what's generating
> > the pixels that the FrameBuffer IP is storing.
> 
> My previous explanation might have been confusing here. I apologize for
> that. 
> To put it in simpler terms the FPGA FrameBuffer Soft IP could be seen
> as the GPU and the DRM driver patch here is allocating memory for
> information to be streamed from the ARM/Linux to the display port.
> Basically the driver just wraps the information such as the pixels to
> be drawn by the FPGA FrameBuffer 2.
> 
> The piece of hardware in discussion is the SoC FPGA where Linux runs on
> the ARM chip and the FGPA is driven by its NIOS soft core with its own
> proprietary firmware.
> 
> For example the application from the ARM Linux would have to write
> information on the /dev/fb0 with the information stored in the SDRAM to
> be fetched by the FPGA framebuffer IP and displayed on the Display Port
> Monitor. 

Ah ok, this sounds like it's indeed suitable for drm. Thanks for clearing
up the confusion ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
