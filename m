From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [RFC 0/2]  Add node and property realloc functions.
Date: Thu, 11 Apr 2013 07:52:40 +0100
Message-ID: <51665DB8.6050304@st.com>
References: <1365604278-17956-1-git-send-email-srinivas.kandagatla@st.com>
 <20130411014439.GN8165@truffula.fritz.box>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130411014439.GN8165-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On 11/04/13 02:44, David Gibson wrote:
> On Wed, Apr 10, 2013 at 03:31:18PM +0100, Srinivas KANDAGATLA wrote:
>> If you try to insert a new node or extend a property with large value, 
>> using fdtput you will notice that it always fails.
>>
>> example:
>> fdtput -v -p -ts ./tst.dtb "/node-1" "property-1" "str10"
>> Error at 'node-1': FDT_ERR_NOSPACE
>>
>> or
>>
>> fdtput -v -c ./tst.dtb "/node-1"
>> Error at 'node-1': FDT_ERR_NOSPACE
>>
>>
>> fdtput -v  -ts ./tst.dtb "/node" "property" "very big value"
>> Decoding value:
>> 	string: 'very big value'
>> Value size 15
>> Error at 'property': FDT_ERR_NOSPACE
>>
>> All these error are returned from libfdt, as the size of the fdt passed
>> has not space to accomdate these new properties.
>>
>> However,
>> libfdt has code to add new property or node or extend a property to an
>> arbitary value, however it cannot be used because all the library
>> functions take preallocated fdt pointer limted to a size.
>>
>> Adding realloc function into libfdt can help tools like fdtput to insert
>> nodes or properties or extend a property.
> Nack.
>
> libfdt deliberately does not use an allocator, to permit embedding in
> weird and limited environments such as bootloaders.
>
> I've thought about adding an optional layer of allocator aware
> functions, but it's not quite as straightforward as you'd think
> because you need to be clear about what the assumptions are on the
> allocation of the given blob - there's no place to put extra context
> to indicate whether it is malloc()ed or part of a larger structure,
> for example.  At the very lease allocating functions would need to
> move to a separate source file from the existing functions.
>
> I think the correct fix in this case is to make fdtput handle the
> FDT_ERR_NOSPACE by reallocating itself, using fdt_open_into() and
> retrying.
Thanks for the comment, I will try to fix fdtput with fdt_open_into.
>
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
