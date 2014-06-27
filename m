From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: Re: OF_DYNAMIC node lifecycle
Date: Fri, 27 Jun 2014 09:41:05 -0500
Message-ID: <53AD8281.8060505@austin.ibm.com>
References: <CACxGe6tsXuLZT=h8S0yRPRPy6Hqz1xkX8G+ViY0cxEUuxZ1dsw@mail.gmail.com> <43898B58-2EA7-42B5-A17A-27F16F2618A6@konsulko.com> <20140623145844.DA6A3C40AE5@trevor.secretlab.ca> <53A9DA69.1040101@austin.ibm.com> <20140625202216.16A8AC40AE6@trevor.secretlab.ca> <53AC7BA3.5030909@austin.ibm.com> <20140627123251.D0857C40859@trevor.secretlab.ca> <94595B4D-1A58-427C-B9CE-C139048FEDCD@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <94595B4D-1A58-427C-B9CE-C139048FEDCD-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/27/2014 07:40 AM, Pantelis Antoniou wrote:
> Hi Grant,
> 
> On Jun 27, 2014, at 3:32 PM, Grant Likely wrote:
> 
>> On Thu, 26 Jun 2014 14:59:31 -0500, Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org> wrote:
>>> On 06/25/2014 03:22 PM, Grant Likely wrote:
>>>> On Tue, 24 Jun 2014 15:07:05 -0500, Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org> wrote:
>>>>> On 06/23/2014 09:58 AM, Grant Likely wrote:
>>>>>> On Thu, 19 Jun 2014 11:33:20 +0300, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>>>>> Hi Grant,
>>>>>>>
> 
> [snip]
> 
>>>
>>> This would affect property updates. When doing a property update the
>>> notifier passes a pointer to a struct containing a device node
>>> pointer and a pointer to the new device node property.
>>>
>>> I know specifically in memory property updates we grab the current version
>>> of the device tree property and compare it to the 'new' version that 
>>> was passed to us.
>>>
>>> If you want to do the DT update before calling the notifier that should be
>>> fine for the memory update code and would only require very minimal
>>> updates.
>>
>> We could change the notifier to include both the old and new values.
>>
>> I've been thinking about changing the notifier format anyway. With the
>> addition of bulk changes, it would be more efficient to send a single
>> notifier for all the changes with a link to the change set instead of
>> one at a time.
>>
> 
> That one has my vote. We also need a bulk change notifier, and for device
> driver use, some kind of wrapper for specific node/properties.
> 
> At the moment a notification is fired for any change in the tree, we might
> work something more fine-grained. Like 'watch this node & subnodes', or
> 'watch this property (or set of properties)'
> 

Both of these updates would work.

For property updates the only real requirement is that we can get to the new
and the old version of the property value.

I like the idea of being able to watch a single node/property. My experience
is that most code is only interested in updates to a single node or
property. Being able to avoid notifying everyone that has registered a
notifier for DT updates for every change would be nice.

-Nathan
-Nathan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
