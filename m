From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Device tree meeting notes from last week
Date: Tue, 10 Dec 2013 13:58:17 +0000
Message-ID: <CACxGe6vJ0P4-LyPHRpLO7cLs_TS0S=YD=Dw7n9g2V-qjUvWgKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sorry for being rather late on getting these out.

Attendees:
Rob Herring
Mark Rutland
Pavel Moll
Jason Cooper
Tomasz Figa
David Woodhouse

Should the ABI and policy documents be separate?
Jason: happy to have it split up or in a single document.


ePAPR: No Stuart no conversation

Devicetree.org: Should approach Linux Foundation for taking
responsibility of devicetree.org.

ACTION on Grant to follow up with LF

Best Practices document: ACTION on MARK to produce first version next week.

Self Test: Waiting on overlays

Schema validation
Tomasz: Looking at extending DTC to support schema language. Working
on validation part. Expect some RFC in near future (before the end of
the year)

New Business
----------------------------
David: Update on ACPI work.
Grant: Do we want to do exactly the same thing in ACPI that we do in DT?
David: Of the opinion that OS should be in control, if we have to do
it in DT, why wouldn't we do it in ACPI?
Grant: We should push for DT and ACPI bindings to be identical
David: it is going to be hard to depend on firmware to setup the hardware
David: Settled on following vocabulary: Translation is bad.
Transliteration is more what we want. The drivers shouldn't have to
know what it is actually backed onto in the common case
David: Big issue is the plethora of different data types. The bios
authors will always get it wrong. ACPI doesn't have a schema validator
either.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
