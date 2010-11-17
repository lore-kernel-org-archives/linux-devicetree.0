From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 1/5] scripts: dtc: Merge in changes from the dtc
	repository
Date: Wed, 17 Nov 2010 09:47:55 -0600
Message-ID: <E1PIkEl-0006Zt-W7@jdl.com>
References: <20101116204917.12146.39851.stgit@riker>
	<20101116204951.12146.21084.stgit@riker>
	<20101117045935.GA12084@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20101117045935.GA12084-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org> 
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
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On Tue, Nov 16, 2010 at 12:49:51PM -0800, John Bonesio wrote:
> > Pull in recent changes from the main dtc repository. These changes primarily
> > allow multiple device trees to be declared which are merged by dtc. This
> > feature allows us to include a basic dts file and then provide more informatio
> n
> > for the specific system through the merging functionality.
> > 
> > Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> 
> Jon & David, I'll need your input on whether or not this is the best
> way to handle updating the dtc copy in the kernel tree.
> 
> g.

Grant,

Yeah, I wondered too. :-)  David added it and updated
in the kernel last round, so he may have some good notion
of what would be best there.

jdl
