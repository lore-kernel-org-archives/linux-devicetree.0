From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: patch "misc/at25,
 dt: Improve at25 SPI eeprom device tree bindings."
 added to char-misc tree
Date: Wed, 5 Sep 2012 16:36:48 -0700
Message-ID: <5047E210.1070206@caviumnetworks.com>
References: <13468794411229@kroah.org> <5047C546.1020804@caviumnetworks.com>
 <20120905233420.GA6104@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120905233420.GA6104-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
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
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/05/2012 04:34 PM, Greg KH wrote:
> On Wed, Sep 05, 2012 at 02:33:58PM -0700, David Daney wrote:
>> On 09/05/2012 02:10 PM, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org wrote:
>>>
>>> This is a note to let you know that I've just added the patch titled
>>>
>>>      misc/at25, dt: Improve at25 SPI eeprom device tree bindings.
>>
>> It is perhaps obvious that I think the patch should be merged (as I
>> wrote it and sent it to you).  However, I think there is a bit of
>> process problem here.  Patches that affect device tree bindings are
>> part of the de facto kernel ABI, and as such, need proper vetting.
>> It is my opinion that neither the original patch, nor this one
>> correcting it, should have been committed without either Grant or
>> Rob giving an Acked-by.
>
> Then next time, please do a RFC or something that indicates that I
> shouldn't be applying a patch without such an Ack.
>

Noted.  I will do that.

> If you want, I will gladly revert this :)

No need, as Rob just Acked-by this patch.

Thanks,
David Daney
