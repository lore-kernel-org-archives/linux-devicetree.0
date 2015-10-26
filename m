From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/35] Few fixes and st21nfca/st-nci vendor_cmds
 support
Date: Mon, 26 Oct 2015 07:41:49 +0100
Message-ID: <562DCB2D.3090503@gmail.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
 <20151026060133.GA24619@zurbaran.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151026060133.GA24619-nKCvNrh56OoJmsy6czSMtA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

I believe there was an issue when you applied my last series.
drivers/nfc/st-nci/vendor_cmds.c is not present and this introduce a 
build fix already reported by kbuild robot.

I am sending a new version fixing the points you mention.

Best Regards
Christophe

On 26/10/2015 07:01, Samuel Ortiz wrote:
> Hi Christophe,
>
> On Sun, Oct 25, 2015 at 10:54:15PM +0100, Christophe Ricard wrote:
>> Hi Samuel,
>>
>> Please find in the following patchset severals fixes as well as vendor_cmds support
>> for st21nfca and st-nci.
>> vendor_cmds includes production test, trimmings & firmware update commands.
>>
>> v2:
>> - Propose a more elegant way to switch between NFC target mode (SLEEP, IDLE).
>> - Remove st21nfca_ and st-nci_ file name prefix.
>> - Merge st21nfca_xxx.h headers into st21nfca.h. Same for st-nci_xxx.h
>>
>> Best Regards
>> Christophe
>> Christophe Ricard (35):
> All patches applied except:
>
>>    nfc: st21nfca: Add support for proprietary commands for factory tests
> - nfc_llc_start/stop need to be exported
> - There is no st21nfca_vendor_cmds.h header file
>
> Cheers,
> Samuel.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
