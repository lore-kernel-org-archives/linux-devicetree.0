From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Device tree bindings for linux ramoops use
Date: Fri, 06 Jan 2012 12:24:27 -1000
Message-ID: <4F07749B.6070703@firmworks.com>
References: <CAOesGMiKBQM61DkLFoTcvMFWV2UCgomLQYDX65_Tkmtoy_hGCg@mail.gmail.com>
 <20120106220908.GJ7457@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120106220908.GJ7457-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Marco Stornelli <marco.stornelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1/6/2012 12:09 PM, Grant Likely wrote:
> On Thu, Jan 05, 2012 at 08:39:50PM -0800, Olof Johansson wrote:
>> Hi,
>>
>> I'm considering how to best describe the data that ramoops needs in
>> the device tree.
>>
>> The idea is really about describing a memory area that is (likely to
>> be) nonvolatile across reboots. Said area is not to be included in the
>> regular memory map of the system (i.e. not covered by /memory).
>>
>> I have a few options on where to do it. It's not really a hardware
>> device per se, so it's a gray area for the device tree alltogether.
>>
>> How about something like?
>>
>> compatible = "linux,ramoops"
>> linux,ramoops-start =<start address of preserved ram>
>> linux,ramoops-size = ...
>
> I'm not a fan of using separate start&  size properties.  I'd rather
> see a 'reg' type property like "linux,ramoops-mem =<start size>;",
> but doing it in separate properties does may early boot code easier to
> write.  I assume that is why the initrd start and size values are
> passed separately.

Separate properties admit the possibility of errors where one is present 
but not the other.  I prefer atomicity.  It's either there, with all the 
information, or it isn't.

>
> I can probably be convinced either way though.
>
> g.
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
