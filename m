From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCHv5 00/16] atmel-isi/ov7670/ov2640: convert to standalone
 drivers
Date: Tue, 21 Mar 2017 13:23:05 +0200
Message-ID: <20170321112304.GM10701@valkosipuli.retiisi.org.uk>
References: <20170311112328.11802-1-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170311112328.11802-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Sat, Mar 11, 2017 at 12:23:12PM +0100, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> 
> This patch series converts the soc-camera atmel-isi to a standalone V4L2
> driver.
> 
> The same is done for the ov7670 and ov2640 sensor drivers: the ov7670 was
> used to test the atmel-isi driver. The ov2640 is needed because the em28xx
> driver has a soc_camera include dependency. Both ov7670 and ov2640 sensors
> have been tested with the atmel-isi driver.
> 
> The first 5 patches improve the ov7670 sensor driver, mostly adding modern
> features such as DT support.
> 
> The next three convert the atmel-isi and move it out of soc_camera.
> 
> The following 6 patches convert ov2640 and drop the soc_camera dependency
> in em28xx. I have tested that this works with my 'SpeedLink Vicious And
> Divine Laplace webcam'.
> 
> The last two patches add isi support to the DT: the first for the ov7670
> sensor, the second modifies it for the ov2640 sensor.
> 
> These two final patches are for demonstration purposes only, I do not plan
> on merging them.
> 
> Tested with my sama5d3-Xplained board, the ov2640 sensor and two ov7670
> sensors: one with and one without reset/pwdn pins. Also tested with my
> em28xx-based webcam.
> 
> I'd like to get this in for 4.12. Fingers crossed.

A question on the last two patches --- what's in the commit description
still holds, right? In that case, how about dropping them from the set?
There have been no changes to those patches during review AFAIR.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
