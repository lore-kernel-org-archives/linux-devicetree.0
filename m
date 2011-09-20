From: "Olivier Martin" <olivier.martin-5wv7dgnIgG8@public.gmane.org>
Subject: Passing an initrd to a Linux kernel with Device Tree
Date: Tue, 20 Sep 2011 18:46:22 +0100
Message-ID: <45292.4717603766$1316541362@news.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Language: en-gb
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

I tried recently to add support in UEFI to pass an initrd with FDT to a
Linux kernel. I have searched the Internet but I did not find any
information to do that.

FYI, this is the way it is done in ATAG:
typedef struct {
  UINT32  start;
  UINT32  size;
} LINUX_ATAG_INITRD2;

The boot loader loads the initrd in system memory and passes the memory
region information through ATAG.


Sorry, if it is the wrong mailing-list. In this case, can someone point me
on the right forum for any Linux FDT oriented questions.

Thanks,
Olivier
