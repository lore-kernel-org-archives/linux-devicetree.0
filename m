From: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3 RFC] dt: add documentation of ARM dt boot interface
Date: Mon, 31 Jan 2011 06:24:00 -0500
Message-ID: <20110131112400.GB13541@zod.rchland.ibm.com>
References: <20110131073918.9058.37628.stgit@localhost6.localdomain6>
	<20110131074510.9058.59071.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110131074510.9058.59071.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
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
Cc: sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 31, 2011 at 12:45:41AM -0700, Grant Likely wrote:
>Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>---
>
>For RFC only.  I do not plan to merge this change yet.
>
>g.
>
> Documentation/devicetree/booting-without-of.txt |   40 +++++++++++++++++++++++
> 1 files changed, 40 insertions(+), 0 deletions(-)
>
>diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
>index 6bca668..3950aea 100644
>--- a/Documentation/devicetree/booting-without-of.txt
>+++ b/Documentation/devicetree/booting-without-of.txt
>@@ -232,6 +233,45 @@ it with special cases.
>   cannot support both configurations with Book E and configurations
>   with classic Powerpc architectures.
>
>+2) Entry point for arch/arm
>+---------------------------
>+
>+   There is one and one single entry point to the kernel, at the start

"one and one" ?

josh
