From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] libfdt: Add function to find regions in an FDT
Date: Mon, 15 Apr 2013 17:50:40 -0700
Message-ID: <CAPnjgZ0GxyyL_JgKm7WPka0rhJiVW3RONmy8px4qihye9kY2_w@mail.gmail.com>
References: <1360968578-18443-1-git-send-email-sjg@chromium.org>
 <1360968578-18443-2-git-send-email-sjg@chromium.org>
 <CAPnjgZ2uPRtDZXt1AwtAnp702sEya6OxtDpEy1kUD=Wox=0CfA@mail.gmail.com>
 <20130322131849.GH13838@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130322131849.GH13838-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On Fri, Mar 22, 2013 at 6:18 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Mar 12, 2013 at 08:46:12PM -0700, Simon Glass wrote:
>> Hi,
>>
>> On Fri, Feb 15, 2013 at 2:49 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> > Given a set of nodes and properties, find the regions of the device tree
>> > which describe those parts.
>> >
>> > A test is provided which builds a tree while tracking where the regions
>> > should be, then calls fdt_first/next_region() to make sure that it agrees.
>> >
>> > Further tests will come as part of fdtgrep.
>> >
>> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> I just wondered if there any any comments on this new version?
>
> Ugh, sorry.  I've been tied up.  From the little I've glanced over it,
> I'm still having trouble getting a coherent feel for the overall
> concept :/

OK I can perhaps write a summary if you give me an idea what I need to
address. Perhaps it is best to look at this by playing with 'fdtgrep'
and seeing how it behaves?

Regards,
Simon
