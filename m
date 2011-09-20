From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Passing an initrd to a Linux kernel with Device Tree
Date: Tue, 20 Sep 2011 14:10:58 -0600
Message-ID: <20110920201058.GM7781@ponder.secretlab.ca>
References: <4e78d3aa.21b0ec0a.63e9.1591SMTPIN_ADDED@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4e78d3aa.21b0ec0a.63e9.1591SMTPIN_ADDED-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Olivier Martin <olivier.martin-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 20, 2011 at 06:46:22PM +0100, Olivier Martin wrote:
> Hello,
> 
> I tried recently to add support in UEFI to pass an initrd with FDT to a
> Linux kernel. I have searched the Internet but I did not find any
> information to do that.
> 
> FYI, this is the way it is done in ATAG:
> typedef struct {
>   UINT32  start;
>   UINT32  size;
> } LINUX_ATAG_INITRD2;
> 
> The boot loader loads the initrd in system memory and passes the memory
> region information through ATAG.
> 
> 
> Sorry, if it is the wrong mailing-list. In this case, can someone point me
> on the right forum for any Linux FDT oriented questions.

Hmmm, it may not be documented (the binding was implemented a long
time ago before we got strict about documenting bindings).  The magic
is two properties in the /chosen node; "linux,initrd-start" and
"linux,initrd-end".  Each contains the physical start and end
addresses of the initrd.

g.
