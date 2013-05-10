From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v4 0/19] Allow images to work on sandbox
Date: Thu, 9 May 2013 17:17:03 -0700
Message-ID: <CAPnjgZ2vZL79dxupWJu4-JYf+fYiNB_qFyh-ZSO4Fzqcb2UCKQ@mail.gmail.com>
References: <1367943123-16013-1-git-send-email-sjg@chromium.org>
 <20130509193647.GR6931@bill-the-cat>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130509193647.GR6931@bill-the-cat>
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
To: Tom Rini <trini-l0cyMroinI0@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, u-boot-review <u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Tom,

On Thu, May 9, 2013 at 12:36 PM, Tom Rini <trini-l0cyMroinI0@public.gmane.org> wrote:
> On Tue, May 07, 2013 at 09:11:44AM -0700, Simon Glass wrote:
>
>> This series adjusts the image code to work with sandbox and prepares it for
>> verified boot to come later.
>>
>> The primary goal here is to get image loading to work on sandbox, which is
>> mostly a set of fairly minor changes such as using map_sysmem() instead of
>> just a cast when converting from a U-Boot address to a pointer. Since
>> common/image.c runs to over 3000 lines and half of it is FIT-related code
>> behind an #ifdef, this code is moved into a new image-fit.c file.
>>
>> Changes in v4:
>> - Bring in upstream version of fdt_first/next_subnode()
>> - Use new upstream fdt_first/next_subnode()
>
> Everything looks fine to me, barring further comments I'll pick this up
> around next Tuesday.

Thanks, The next series to hopefully improve image support is queued
up, and I will get the final one done also.

Regards,
Simon
