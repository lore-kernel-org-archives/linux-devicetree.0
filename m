From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] drivercore: Output common devicetree information in uevent
Date: Wed, 1 Feb 2012 14:29:35 -0700
Message-ID: <CACxGe6uafURnPOGRNpKKXXMM06JHFoqDVqHojQdv_aeCAd_Sfg@mail.gmail.com>
References: <1328121082-21802-1-git-send-email-grant.likely@secretlab.ca> <1328130989.28487.83.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1328130989.28487.83.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Tobias Klauser <tklauser@distanz.ch>, Frederic Lambert <frdrc66@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Mark Brown <broonie@sirena.org.uk>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <greg@kroah.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 1, 2012 at 2:16 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Wed, 2012-02-01 at 11:31 -0700, Grant Likely wrote:
>> The original function also creates a MODALIAS property for the
>> compatible
>> list, but that code has not been generalized into the common case
>> because
>> it has the potential to break module loading on a lot of bus types.
>> Bus
>> types are still responsible for their own MODALIAS properties.
>>
>> Boot tested on ARM and compile tested on PowerPC and SPARC.
>>
>>
> We also want to generalize adding the devspec property that we have on
> PCI to all devices no ?

The pci_show_devspec() function?  Yeah, that can be generalized, but
haven't researched where the best place to hook it in should be.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
