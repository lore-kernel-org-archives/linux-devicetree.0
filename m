From: John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 0/8] Basic ARM device tree support
Date: Mon, 31 Jan 2011 11:06:47 -0700
Message-ID: <89a3dcf3-ee44-428d-b248-ca1853a4fc6d@VA3EHSMHS004.ehs.local>
References: <20110118195933.13011.56098.stgit@localhost6.localdomain6>
	<00bcd596-2108-4c54-92d3-7fda39e333e3@VA3EHSMHS015.ehs.local>
	<20110131180512.GA15429@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <20110131180512.GA15429-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lennert Buijtenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Grant Likely [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Grant
Likely
> Sent: Monday, January 31, 2011 11:05 AM
> To: John Linn
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Nicolas Pitre; Russell King;
Catalin Marinas; devicetree-
> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Olof
Johansson; Jeremy Kerr; Lennert
> Buijtenhek
> Subject: Re: [PATCH 0/8] Basic ARM device tree support
> 
> On Wed, Jan 26, 2011 at 01:04:39PM -0700, John Linn wrote:
> > > -----Original Message-----
> > > From: Grant Likely [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of
Grant Likely
> > > Sent: Tuesday, January 18, 2011 1:29 PM
> > > To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > > Cc: Nicolas Pitre; Russell King; Catalin Marinas;
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-
> > > kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Olof Johansson; Jeremy Kerr; John Linn;
Lennert Buijtenhek
> > > Subject: [PATCH 0/8] Basic ARM device tree support
> > >
> >
> > Thanks for this patch set.  Device tree on ARM will be a great help
to Xilinx.
> >
> > Tested-by: John Linn <john.linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> 
> Thanks John,
> 
> I've had to rework the early init code to be safer, but it turned out
> to be a significant change, so I won't add your tested-by line to the
> patch yet.  Would you mind retesting when I repost later today?

Sure, will do.

- John

> 
> Thanks,
> g.
> 


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
