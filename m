From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/5] fdtput: Prepare to support multiple operations
Date: Thu, 12 Jul 2012 17:49:41 +0200
Message-ID: <CAPnjgZ2+ecT72nv3Za6jUKkrLeerrhv5H1=OvuOBU1xiTyo1kA@mail.gmail.com>
References: <1341925008-10627-1-git-send-email-sjg@chromium.org>
 <1341925008-10627-2-git-send-email-sjg@chromium.org>
 <20120712123745.GB11326@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120712123745.GB11326-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Thu, Jul 12, 2012 at 2:37 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Jul 10, 2012 at 05:56:45AM -0700, Simon Glass wrote:
>> We want to add new options to this tool. In preparation for this, add
>> the concept of a current operation.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>  fdtput.c |   37 ++++++++++++++++++++++++++-----------
>>  1 files changed, 26 insertions(+), 11 deletions(-)
>>
>> diff --git a/fdtput.c b/fdtput.c
>> index 244d1f1..eceb7f2 100644
>> --- a/fdtput.c
>> +++ b/fdtput.c
>> @@ -28,7 +28,13 @@
>>
>>  #include "util.h"
>>
>> +/* These are the operations we support */
>> +enum operation_t {
>
> This isn't quite usual convention xxx_t usually indicates a typedef

OK I will fix it, and also update the help messages a little in two of
the patches (something I just noticed).

Regards,
Simon

>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
