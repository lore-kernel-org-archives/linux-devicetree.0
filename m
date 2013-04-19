From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] fdtput: expand fdt if value does not fit.
Date: Fri, 19 Apr 2013 09:33:30 +0100
Message-ID: <5171015A.8050604@st.com>
References: <1366007810-17881-1-git-send-email-srinivas.kandagatla@st.com>
 <20130419005630.GM16400@truffula.fritz.box>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130419005630.GM16400-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 19/04/13 01:56, David Gibson wrote:
> On Mon, Apr 15, 2013 at 07:36:50AM +0100, Srinivas KANDAGATLA wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>>
>> If you try to insert a new node or extend a property with large value,
>> using fdtput you will notice that it always fails.
>>
>> example:
>> fdtput -v -p -ts ./tst.dtb "/node-1" "property-1" "value-1
>> Error at 'node-1': FDT_ERR_NOSPACE
>>
>> or
>>
>> fdtput -v -c ./tst.dtb "/node-1"
>> Error at 'node-1': FDT_ERR_NOSPACE
>>
>> or
>>
>> fdtput -v  -ts ./tst.dtb "/node" "property" "very big value"
>> Decoding value:
>> 	string: 'very big value'
>> Value size 15
>> Error at 'property': FDT_ERR_NOSPACE
>>
>> All these error are returned from libfdt, as the size of the fdt passed
>> has no space to accomdate these new properties.
>>
>> This patch adds realloc functions in fdtput to allocate new space in fdt
>> when it detects a shortage in space for new value or node. With this
>> patch, fdtput can insert a new node or property or extend a property
>> with new value greater than original size.
>>
>> Without this patch fdtput tool complains with FDT_ERR_NOSPACE when we
>> try to add a node/property or extend the value of a property.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> Your realloc functions could overestimate the required size in some
> cases, so you should put an fdt_pack() before you write the final blob
> out to clean up any extra padding.
Thanks for the comments,
I will send v2 patch considering your comments.
--srini
>
> Other than that, looks good.
>
