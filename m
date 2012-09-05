From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: patch "misc/at25,
 dt: Improve at25 SPI eeprom device tree bindings."
 added to char-misc tree
Date: Wed, 5 Sep 2012 14:33:58 -0700
Message-ID: <5047C546.1020804@caviumnetworks.com>
References: <13468794411229@kroah.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <13468794411229-4DuetyUvsWfYtjvyW6yDsg@public.gmane.org>
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
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/05/2012 02:10 PM, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org wrote:
>
> This is a note to let you know that I've just added the patch titled
>
>      misc/at25, dt: Improve at25 SPI eeprom device tree bindings.

It is perhaps obvious that I think the patch should be merged (as I 
wrote it and sent it to you).  However, I think there is a bit of 
process problem here.  Patches that affect device tree bindings are part 
of the de facto kernel ABI, and as such, need proper vetting.  It is my 
opinion that neither the original patch, nor this one correcting it, 
should have been committed without either Grant or Rob giving an Acked-by.

David Daney.


>
> to my char-misc git tree which can be found at
>      git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
> in the char-misc-next branch.
>
> The patch will show up in the next release of the linux-next tree
> (usually sometime within the next 24 hours during the week.)
>
> The patch will also be merged in the next major kernel release
> during the merge window.
>
> If you have any questions about this process, please let me know.
>
>
>  From d6ae0d578d24303941c1424b049d2cae28277666 Mon Sep 17 00:00:00 2001
> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> Date: Wed, 22 Aug 2012 12:03:57 -0700
> Subject: misc/at25, dt: Improve at25 SPI eeprom device tree bindings.
>
> Commit 002176db (misc: at25: Parse dt settings) added device tree
> bindings the differ significantly in style from the I2C EEPROM
> bindings and don't seem well vetted.  Here I deprecate (but still
> support) the "at25,*" properties, and add what I hope is a better
> alternative.  These new bindings also happen to be deployed in the
> field and were previously submitted for consideration here:
>
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-May/015556.html
>
> The advantages of the new bindings are that they are similar to the
> I2C EEPROMs and they don't conflate read-only and the address width
> modes in a binary encoded blob.
>
> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> Cc: Alexandre Pereira da Silva <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> Cc: Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/misc/at25.txt | 34 +++++++---
>   drivers/misc/eeprom/at25.c                      | 83 +++++++++++++++++--------
>   2 files changed, 82 insertions(+), 35 deletions(-)
>
[...]
