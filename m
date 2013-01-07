From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: CoreSight framework and drivers
Date: Mon, 7 Jan 2013 11:58:36 +0000
Message-ID: <20130107115836.GB13542@mudshark.cambridge.arm.com>
References: <1355858365-11849-1-git-send-email-pratikp@codeaurora.org>
 <20121219112314.GA26329@mudshark.cambridge.arm.com>
 <50D1F37E.6000804@ti.com>
 <20121219212431.GC23594@pratikp-linux.qualcomm.com>
 <50D34EE5.8090407@ti.com>
 <20121220195127.GA14877@pratikp-linux.qualcomm.com>
 <50D3972E.4030607@ti.com>
 <20121221221828.GA2658@pratikp-linux.qualcomm.com>
 <20121223113239.GG16237@mudshark.cambridge.arm.com>
 <20130103180643.GA30277@pratikp-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130103180643.GA30277-9H3kiKr51/JHGpnEYu0o6d07Fnf2crXX0E9HWUfgJXw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Pratik Patel <pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "magnus.p.persson-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <magnus.p.persson-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "david.rusling-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <david.rusling-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "dsaxena-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dsaxena-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "d-deao-l0cyMroinI0@public.gmane.org" <d-deao-l0cyMroinI0@public.gmane.org>, "christian.bejram-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <christian.bejram-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 03, 2013 at 06:06:43PM +0000, Pratik Patel wrote:
> On Sun, Dec 23, 2012 at 11:32:39AM +0000, Will Deacon wrote:
> > On Fri, Dec 21, 2012 at 10:18:28PM +0000, Pratik Patel wrote:
> > > What user interface do you plan to provide for the CTI? Maybe
> > > something consistent with other CoreSight components in sysfs to
> > > allow users to enable, disable, map and unmap ???
> > > 
> > > Please let me know your thoughts.
> > 
> > Rather than have your current approach of dev nodes + sysfs config files for
> > each coresight device, I think it might be better to follow something closer
> > to ftrace and stick per-device directories under debugfs/coresight/. Then you
> > can have a pipe file and some config files in the same directory for each
> > component. You also don't need to do any mapping operations with this (just
> > post-process the stream directly).
> > 
> 
> Thanks for the suggestion. I had initially debated between debugfs
> and sysfs but chose sysfs + dev nodes since using device attributes
> relieves the drivers from manually managing directories and files,
> its taken care of by the device and sysfs layers. Moreover, since
> these are physical devices, device attributes made sense at the
> time.
> 
> The map and unmap I was referring to was for the CTI trigger
> mappings. Dev nodes are currently intended to provide the raw
> data collected in the sinks.
> 
> Whats the advantage in using debugfs here?

The main things I like about debugfs are (a) it's a text-driven interface
and easy to script with and (b) it matches what we do for ftrace.

Furthermore, it means that subtle differences between devices can be hidden
in the driver and not require different vendor tools for parsing the trace
data.

Will
