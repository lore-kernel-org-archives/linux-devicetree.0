From: "M. Warner Losh" <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/6] of/device: populate platform_device (of_device)
	resource table on allocation
Date: Thu, 10 Jun 2010 11:09:15 -0600 (MDT)
Message-ID: <20100610.110915.487329959621854233.imp@bsdimp.com>
References: <20100610154741.GA7484@oksana.dev.rtsoft.ru>
	<20100610.100140.8559628065321695.imp@bsdimp.com>
	<20100610165243.GA18043@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100610165243.GA18043-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

In message: <20100610165243.GA18043-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
            Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
: On Thu, Jun 10, 2010 at 10:01:40AM -0600, M. Warner Losh wrote:
: [...]
: > But this requires extra, bogus fields in the structure
: 
: False. The [0] field isn't bogus, it has a defined meaning.
: It says: here is some amount of resouces may be allocated.

Not false: It is extra fields and extra lines of code.  The fact that
it is well defined doesn't make it any less bogus.  But again, that's
just opinion, much like your objection to the equally well defined
structure it replaces is bogus.

: > and creates a bogus sizeof issue.
: 
: Creates? False. The same sizeof problem exists in Grant's
: approach. sizeof(*dev) != what_we_have_allocated. Which is
: isn't great, I agree. And that's exactly why I proposed a
: dedicated allocation in the first place.

Your solution doesn't solve the sizeof issue.  Don't pretend it does.
Both ways allocate a random amount of memory larger than sizeof the
structure.

Warner
