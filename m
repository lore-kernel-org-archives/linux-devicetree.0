From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Deprecating of_platform, the path from here...
Date: Thu, 10 Dec 2009 13:47:33 -0700
Message-ID: <fa686aa40912101247k55d56783ge0163dd1da073b49@mail.gmail.com>
References: <fa686aa40912091406i2ef4e1b2u25c9f46b20786245@mail.gmail.com>
	<20091209.161550.168794100.davem@davemloft.net>
	<20091209.162121.256573183.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091209.162121.256573183.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Wed, Dec 9, 2009 at 5:21 PM, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org> wrote:
> From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
> Date: Wed, 09 Dec 2009 16:15:50 -0800 (PST)
>
>> From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Date: Wed, 9 Dec 2009 15:06:29 -0700
>>
>>> 1) of_platform will be deprecated in preference of the platform bus.
>>
>> What a shame, it's one of the cleanest driver probing models
>> in the tree.
>
> And BTW, have you folks who "decided" this considered at all the fact
> that it is much easier to describe represent platform devices using
> of OF devices rather than the other way around?

Yup.  I also think of_platform is a cleaner implementation than
platform, but the fact remains that there are far more platform
drivers than there are of_platform.  So, as nice as of_platform is, it
still does pretty much exactly the same job as platform.  I'd rather
see of_platform features migrated to platform than creating drivers
with dual registrations to be used on both OF and non-OF platforms.

Trying to go the other way around (deprecate platform and encouraging
of_platform instead) I don't think will gain much traction; whereas I
think bringing of_platform features into platform will be an easier
sell.  I'm trying to be pragmatic here.

> The platform device pdata mechanism requires data structure changes
> and is not dynamically extensible, whereas OF devices are
> fundamentally so.
>
> I don't like the idea to get rid of of_platform devices at all.

There are no plans to actually remove of_platform.  I certainly don't
plan to try and force SPARC to switch from of_platform to platform
bus.  But on PowerPC (and probably Microblaze) the plan is to move
away from of_platform for all the reasons discussed, and I'm not be
bringing of_platform over as I work on ARM support.

> OF devices are really clean, much like netlink messages, where
> arbitrary named attributes can be added or removed without any data
> structure changes at all.

No argument here.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
