From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/3] dt: documentation reorganization
Date: Mon, 31 Jan 2011 23:23:11 +0100
Message-ID: <20110131222311.GA7903@merkur.ravnborg.org>
References: <20110131073918.9058.37628.stgit@localhost6.localdomain6>
	<20110131203449.GA4199@merkur.ravnborg.org>
	<20110131210131.GA14086@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110131210131.GA14086-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 31, 2011 at 02:01:31PM -0700, Grant Likely wrote:
> On Mon, Jan 31, 2011 at 09:34:49PM +0100, Sam Ravnborg wrote:
> > On Mon, Jan 31, 2011 at 12:44:41AM -0700, Grant Likely wrote:
> > > This series reorganizes and cleans up the device tree documentation
> > > to make the directory useful for non-powerpc users.
> > 
> > Looks better than first try. But the structure is very flat.
> > Did you consider an arch/* for all arch specific stuff?
> 
> Yes I did; but this stuff is pretty sparse so I didn't want to create
> a whole lot of levels when it isn't warranted.  If really required in
> the future I'll split the arch and drivers into two separate
> directories.  In the mean time I'm going to stick with this.
OK.

	Sam
