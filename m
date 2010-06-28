From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Using devices trees on X86
Date: Mon, 28 Jun 2010 10:57:33 -0700
Message-ID: <0bcc23b9-2cbd-4465-b17c-7b3c2dff9fd3@VA3EHSMHS007.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant,

OK, here's the current set of patches...  The end goal of which is to be
able to parse a device
tree and generate a set of struct device objects on any architecture,
but specifically X86.
I can't see that much of this is anywhere near
final form, hence the lack of signed-off-by lines.  It does compile on
X86, although it's not
clear that I actually get any devices discovered behind the PCI bus yet.
I'll summarize a couple
of issues, that you can see in somewhat concrete form in the patches:

1) no _ALIGN on x86, which you've already dealt with
2) config OF is currently implemented in the architecture code.  This
should be non-architecture dependent and selected by the arches that
need it.
3) Theres a bunch of support functions that drivers/of requires.  Some
are just stubs and some seem to actually
do something non-trivial (like the SMP affinity mappings).  Probably all
of this should get stubs with weak symbols so that the arches don't have
to do anything special, especially since I expect pushback from adding
this architecture code "Just for device trees".

Comments greatly appreciated, in particular if you have
likely-to-be-easy-to-get-accepted suggestions for 3), or feel like
carefully solving 2) in
a way which doesn't bork the existing of-based arches.

Steve


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
