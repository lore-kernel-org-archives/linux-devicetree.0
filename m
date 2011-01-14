From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Require guidance on ARM device tree
Date: Fri, 14 Jan 2011 15:08:47 -0700
Message-ID: <AANLkTi=5+jdEYhzXM7Jfkej7cgqD_v4Cju9-XvNLQ-f4@mail.gmail.com>
References: <AANLkTikUdJTWg2qGw_AASZNW+yivAXCf4qzSd-yF6N=p@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikUdJTWg2qGw_AASZNW+yivAXCf4qzSd-yF6N=p@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 14, 2011 at 1:28 PM, Thomas Abraham
<thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi,
>
> I am currently working on device tree support for Samsung's S5PV310
> Cortex-A9 platform. This work is based on
> git://git.secretlab.ca/git/linux-2.6.git test-devicetree.
>
> It would be very helpful to know if this is the correct place to start or if
> there is a better location. Any other suggestions on how to go about adding
> device tree support for a ARM platform would be very helpful.

Hi Thomas.  It's as good a place as any to start, but that branch does
get rebased from time to time.  I'm in the process of creating a new
branch for arm-devicetree which will be stable and won't get rebased.
I'll be announcing it on the devicetree-discuss list once I've got it
pushed out.

g.
