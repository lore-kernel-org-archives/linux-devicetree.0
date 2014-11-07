From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv3 4/5] edac: altera: Add Altera L2 Cache and OCRAM EDAC
 Support
Date: Fri, 7 Nov 2014 10:31:20 -0600
Message-ID: <545CF3D8.1020500@opensource.altera.com>
References: <1414683131-20786-1-git-send-email-tthayer@opensource.altera.com> <1414683131-20786-5-git-send-email-tthayer@opensource.altera.com> <20141104151214.GD9570@pd.tnic> <545959E8.2040005@opensource.altera.com> <20141106163134.GF4318@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141106163134.GF4318-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

On 11/06/2014 10:31 AM, Borislav Petkov wrote:
> Hi Thor,
> 
> On Tue, Nov 04, 2014 at 04:57:44PM -0600, Thor Thayer wrote:
>> We want to at least separate L2/OCRAM ECC from the SDRAM ECC because
>> 1) the SDRAM preparation can take almost 2 seconds on boot and some
>> customers need a faster boot time.
>> 2) the SDRAM has an ECC initialization dependency on the preloader which is
>> outside the kernel. It is desirable to be able to turn the SDRAM on & off
>> separately.
> 
> Well, now that I asked and you gave valid reasons for the split,
> you should keep them split the way they are. But please do add that
> explanation to the commit message so that it is clear to people why
> there is a split.
> 
>> You bring up a good point about the L2 and OCRAM being combined though.
>>
>> If we do want granular control, maybe I should use a submenu? Or isn't that
>> desirable either?
> 
> Well, what do you think would be easier/faster for a user configuring? A
> separate menu where you have to do a couple of key presses just to enter
> it or simply a subtree in Kconfig with all the options together. I think
> the "depends" gives you that already...
> 
> Ok, once you've worked in the suggested changes, you're good to go,
> at least for the EDAC bits. Let me know how you want to handle this,
> whether I should pick up the whole thing or I should ack the EDAC parts.
> This patchset should go together, in any case, and so I don't care
> whoever picks it up.
> 

If it's okay, can you please pick up this series, once everything is
cleaned up? I just checked to make sure that there aren't any merge
conflicts in the DTS files in this series against DTS patches that I
have queue up for 3.19, and there aren't.

Thanks,
Dinh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
