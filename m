From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [RFC PATCH 3.7.0-rc4 0/4] introduce of_simple_module_id_table
 macro
Date: Wed, 28 Nov 2012 10:33:18 +0000
Message-ID: <50B5E86E.5030905@st.com>
References: <1353072068-17758-1-git-send-email-srinivas.kandagatla@st.com>
 <20121120164531.8C8013E102F@localhost>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121120164531.8C8013E102F@localhost>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20/11/12 16:45, Grant Likely wrote:
> On Fri, 16 Nov 2012 13:21:08 +0000, Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org> wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>>
>> This patch series introduces of_simple_module_id_table macro and as an example
>> uses this macro in 3 files.
>>
>> Most of the device tree supported drivers have of_device_id table setup with 
>> single compatible entry, this use-case is very simple and common.
>>
>> #ifdef CONFIG_OF
>> static struct of_device_id xxx_of_match[] = {
>> 	{ .compatible = "yyy,zzz" },
>> 	{ },
>> };
>> MODULE_DEVICE_TABLE(of, xxx_of_match);
>> #endif
>>
>> This patch adds a macro for this simple type of device table.
>> Other subsystems like pm, platform, have similar macros in kernel for
>> simplest cases.
>> Now the user can just replace the above code with
>>
>> of_simple_module_id_table(xxx_of_match, "yyy,zzz");
>>
>> There are more than 200+ hits for this type of pattern in the current kernel.
> While I like the reduction in lines of source code, I'm not so fond of
> the form. There is no easy way to extend the syntax for multiple
> entries and it doesn't cover the frequently present .data field. Can you
> think of a way to do this that can take a variable number of table
> entries?
I think adding data field is straight forward I will send a v2 of this
macro.
However adding variable number of table entries kills the very purpose
of this simple macro in the first-place.

>
> g.
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
