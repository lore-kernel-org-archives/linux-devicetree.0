MIME-Version: 1.0
In-Reply-To: <CAPDyKFpTyn2isNahywmOOSWiZKov9xsudyWi_i-FejXjC+1AZw@mail.gmail.com>
References: <20170104205536.15963-1-d-gerlach@ti.com>
	<20170104205536.15963-3-d-gerlach@ti.com>
	<20170109175012.sg7eze7llqq7qevd@rob-hp-laptop>
	<7bd282d9-df6f-f4c6-1f7f-c8ed81c78af3@ti.com>
	<CAL_JsqKxU4c=KSn0=xX9kmbk498fhqpiXMeGjcoe8Ah48FAzUg@mail.gmail.com>
	<3bb89649-fd2a-acc6-6968-e54a00842ce2@ti.com>
	<CAL_JsqL+L1oHAOv7tLevzbtRFSKRs9J01SgF=HR_vNNqNV+4+Q@mail.gmail.com>
	<84d7d49b-933b-8b26-f18a-3a5054738cb1@ti.com>
	<CAL_JsqJ9RitNC7ihC8ckJgV+49kaHk=W9tgdNBSjEfydhQS46A@mail.gmail.com>
	<0eaa9914-83f1-7716-cf04-1e3dd44df647@ti.com>
	<4cb25cf9-216f-2e18-f45d-ef7e48fa6c5e@ti.com>
	<m2ziip2puf.fsf@baylibre.com>
	<CAL_Jsq+Vp8iYrAUmuSRzeeY_G6CUqFqG6XB6erDxo1RYo3g4=g@mail.gmail.com>
	<CAPDyKFqzs59N5bc89X-96Fgy9b=_+s8zYmHHshQeDrJCnaqprA@mail.gmail.com>
	<58821CA2.4050701@ti.com>
	<CAPDyKFpTyn2isNahywmOOSWiZKov9xsudyWi_i-FejXjC+1AZw@mail.gmail.com>
Date: Thu, 26 Jan 2017 10:01:10 -0600
Message-ID: <CAL_Jsq+8OS9u=LFzcfucu-Mz60x_6MAi=Cc3sxfb_3E_+RugMw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: Add TI SCI PM Domains
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dave Gerlach <d-gerlach@ti.com>, Kevin Hilman <khilman@baylibre.com>, Tero Kristo <t-kristo@ti.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Keerthy <j-keerthy@ti.com>, Russell King <rmk+kernel@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jan 20, 2017 at 10:52 AM, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> [...]
>
>>>> Another option is create something new either common or TI SCI
>>>> specific. It could be just a table of ids and phandles in the SCI
>>>> node. I'm much more comfortable with an isolated property in one node
>>>> than something scattered throughout the DT.
>>>
>>> To me, this seems like the best possible solution.
>>>
>>> However, perhaps we should also consider the SCPI Generic power domain
>>> (drivers/firmware/scpi_pm_domain.c), because I believe it's closely
>>> related.
>>> To change the power state of a device, this PM domain calls
>>> scpi_device_set|get_power_state() (drivers/firmware/arm_scpi.c), which
>>> also needs a device id as a parameter. Very similar to our case with
>>> the TI SCI domain.
>>>
>>> Currently these SCPI device ids lacks corresponding DT bindings, so
>>> the scpi_pm_domain tries to work around it by assigning ids
>>> dynamically at genpd creation time.
>>>
>>> That makes me wonder, whether we should think of something common/generic?
>>
>> When you say something common/generic, do you mean a better binding for genpd,
>> or something bigger than that like a new driver? Because I do think a phandle
>> cell left open for the genpd provider to interpret solves both the scpi and
>> ti-sci problem we are facing here in the best way. Using generic PM domains lets
>> us do exactly what we want apart from interpreting the phandle cell with our
>> driver, and I feel like anything else we try at this point is just going to be
>> to work around that. Is bringing back genpd xlate something we can discuss?
>
> Bringing back xlate, how would that help? Wouldn't that just mean that
> you will get one genpd per device? That's not an option, I think we
> are all in agreement to that.
>
> Or am I missing something here?

Why? I have cells for interrupts and only have 1 interrupt controller. Or cells for clocks and only 1 clock controller.

I think the test is: is the ID meaningful to (or defined by) the device or the power domain controller? The former should be a property in the node. The latter should be phandle args.

> Regarding something "common/generic", I was merely thinking of some
> common bindings describing the list of phandle to device ids mapping.
> However, let's not make this more complicated than it is already. So
> please just ignore my suggestion so we can make this work for your
> case first.
>
> However, maybe I didn't fully understood Rob's suggestion. Perhaps Rob
> can clarify once more.
>
> Anyway, this is how interpreted Rob's suggestion:
>
> TISCI_PM_DOMAIN_DEVLIST: tisci-pm-domain-devlist {
>      devs = <&serial0>, <&mmc0>;
>      devids = <5 10>;
> }
>
> With this, you should be to extract the devid which corresponds to the
> device that has been attached to the TI SCI PM domain. Don't you
> think?
>
> Kind regards
> Uffe
